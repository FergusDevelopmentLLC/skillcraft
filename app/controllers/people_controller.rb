# rubocop:disable ClassLength
class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy, :randomize_avatar]	
  
  # GET /students/new
  def new
    @people = Person.teacher_student
    @person = Person.new
  end

  def show; end
  
  # GET /login
  def login; end

  def index
    @people = if request.path == "/students"
                Student.all
              else
                Teacher.all
              end
  end
  
  def post_login
    
    @person = Person.find_by(:user_name => params[:user_name])
    
    if(@person && @person.authenticate(params[:password]))
        respond_to do |format|
          session[:user_id] = @person.id
          format.html { redirect_to courses_path, notice: 'Welcome to SkillCraft, a place to craft your skills'}
        end
    else
        respond_to do |format|
          format.html { redirect_to login_path, notice: 'User name or password incorrect'}
        end
    end
  end
    
  def create
    
    @person = Person.new(person_params)

    @person.avatar = Avatar.unused_avatar
    
    match = Course.find_by(:code => params[:person][:course_code])

    if match
      @person.courses << match
    end

    respond_to do |format|
      if @person.save
        if(@person.type == "Student")
          format.html { redirect_to student_path(@person), notice: "#{@person.type} was successfully created" }
        else
          format.html { redirect_to teacher_path(@person), notice: "#{@person.type} was successfully created" }
        end
      else
        @people = Person.teacher_student
        format.html { render :new }
      end
    end

  end

  def update
    
    @person.errors.clear

    matched_course = nil

    if @person.type == "Student" && params[:student][:course_code].blank? == false
      matched_course = Course.find_by(code: params[:student][:course_code])
    elsif params[:teacher] && params[:teacher][:course_code].blank? == false
      matched_course = Course.find_by(code: params[:teacher][:course_code])
    end
    
    if matched_course
      @person.courses << matched_course unless @person.courses.map(&:code).include?(matched_course.code)
    elsif (params[:student] && params[:student][:course_code].blank? == false) || (params[:teacher] && params[:teacher][:course_code].blank? == false)
      @person.errors.add(:course, 'code incorrect')
    end

    respond_to do |format|
      if @person.errors.count.zero? && @person.update(person_params)
        if @person.type == "Student"
          format.html { redirect_to @person, notice: 'Student was successfully updated' }
        else
          format.html { redirect_to @person, notice: 'Teacher was successfully updated' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def logout
    
    respond_to do |format|
      session[:user_id] = nil #using session.clear interfered with flash messages being displayed
      format.html { redirect_to root_path, notice: 'Come back soon!'}
    end

  end
  
  def randomize_avatar 
    @person.avatar = Avatar.unused_avatar
    respond_to do |format|
      if @person.save
        if @person.type == "Student"
          format.html { redirect_to student_path(@person), notice: 'Student was successfully updated' }
        else
          format.html { redirect_to teacher_path(@person), notice: 'Teacher was successfully updated' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def edit; end

  def destroy
    respond_to do |format|
      @person.destroy
      if @person.type == "Student"
        format.html { redirect_to students_url, notice: "#{@person.user_name} was successfully destroyed" }
      else
        format.html { redirect_to teachers_url, notice: "#{@person.user_name} was successfully destroyed" }
      end
    end
  end
  
  private
  
    def set_person
      @person = Person.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def person_params
      if @person
        if @person.type == "Student"
          params.require(:student).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
        else
          params.require(:teacher).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
        end
      else
        params.require(:person).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
      end
    end

end
# rubocop:enable ClassLength