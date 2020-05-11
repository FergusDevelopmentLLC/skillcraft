# rubocop:disable ClassLength
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :randomize_avatar]	
  
  def new
    @users = User.teacher_student
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def login; end

  def index
    @users = if request.path == "/students"
               Student.all
             else
               Teacher.all
             end
  end
  
  def post_login
    @user = User.find_by(:user_name => params[:user_name])
    if(@user && @user.authenticate(params[:password]))
        respond_to do |format|
          session[:user_id] = @user.id
          format.html { redirect_to courses_path, notice: 'Welcome to SkillCraft, a place to craft your skills'}
        end
    else
        respond_to do |format|
          format.html { redirect_to login_path, notice: 'User name or password incorrect'}
        end
    end
  end
    
  def create
    
    @user = User.new(user_params)

    @user.avatar = Avatar.unused_avatar
    
    match = Course.find_by(:code => params[:user][:course_code])

    if match
      @user.courses << match
    end

    respond_to do |format|
      if @user.save
        if(@user.type == "Student")
          format.html { redirect_to student_path(@user), notice: "#{@user.type} was successfully created" }
        else
          format.html { redirect_to teacher_path(@user), notice: "#{@user.type} was successfully created" }
        end
      else
        @users = User.teacher_student
        format.html { render :new }
      end
    end

  end

  def update
    
    @user.errors.clear

    matched_course = nil

    if @user.type == "Student" && params[:student][:course_code].blank? == false
      matched_course = Course.find_by(code: params[:student][:course_code])
    elsif params[:teacher] && params[:teacher][:course_code].blank? == false
      matched_course = Course.find_by(code: params[:teacher][:course_code])
    end
    
    if matched_course
      @user.courses << matched_course unless @user.courses.map(&:code).include?(matched_course.code)
    elsif (params[:student] && params[:student][:course_code].blank? == false) || (params[:teacher] && params[:teacher][:course_code].blank? == false)
      @user.errors.add(:course, 'code incorrect')
    end

    respond_to do |format|
      if @user.errors.count.zero? && @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.user_name} was successfully updated" }
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
    @user.avatar = Avatar.unused_avatar
    respond_to do |format|
      if @user.save
        format.html { redirect_to student_path(@user), notice: "#{@user.user_name} was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def edit; end

  def destroy
    respond_to do |format|
      @user.destroy
      if @user.type == "Student"
        format.html { redirect_to students_url, notice: "#{@user.user_name} was successfully destroyed" }
      else
        format.html { redirect_to teachers_url, notice: "#{@user.user_name} was successfully destroyed" }
      end
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def user_params
      if @user
        if @user.type == "Student"
          params.require(:student).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
        else
          params.require(:teacher).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
        end
      else
        params.require(:user).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
      end
    end

end
# rubocop:enable ClassLength