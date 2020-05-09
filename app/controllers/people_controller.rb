class PeopleController < ApplicationController
  #before_action :set_person, only: [:show, :edit, :destroy]	
  
  # GET /students/new
  def new
    
    @people = []
    teacher = Teacher.new
    teacher.type = "Teacher"
    teacher.save
    @people.push(teacher)
    student = Student.new
    student.type = "Student"
    student.save
    @people.push(student)

    @person = Person.new
  
  end
  
  # GET /login
  def login
    
    #one
    
    # #binding.pry
    
    # @user = User.find_by(:username => params[:user][:username])
    # if(@user && @user.authenticate(params[:user][:password]))
    #     session[:user_id] = @user.id
    #     redirect "/"
    # else
    #     flash[:error] = "User name or password incorrect"
    #     redirect "/login"
    # end
  end
  
  # GET /post_login
  # GET /post_login/1.json
  def post_login
    
    #  #binding.pry

    @person = Person.find_by(:user_name => params[:user_name])
    
    if(@person && @person.authenticate(params[:password]))
        respond_to do |format|
          session[:user_id] = @person.id
          format.html { redirect_to courses_path, notice: 'Welcome to SkillCraft, a place to craft your skills'}
          format.json { head :no_content }#//TODO correct this
          # format.json { render :index, status: :ok, location: @student }
        end
    else
        respond_to do |format|
          format.html { redirect_to login_path, notice: 'User name or password incorrect'}
          format.json { head :no_content }#//TODO correct this
          # format.json { render :index, status: :ok, location: @student }
        end
    end
  end
    
  # POST /people
  # POST /people.json
  def create

     #binding.pry

    @person = Person.new(person_params)
    
     #binding.pry

    match = Course.find_by(:code => params[:person][:course_code])

    if match
      @person.courses << match
    end

     #binding.pry

    respond_to do |format|
    
      if @person.save

         #binding.pry    

        if(@person.type == "Student")
          format.html { redirect_to student_path(@person), notice: "#{@person.type} was successfully created" }
        else
          format.html { redirect_to teacher_path(@person), notice: "#{@person.type} was successfully created" }
        end
        #format.json { render :show, status: :created, location: @student } //TODO: fix
      
      else
        format.html { render :new }
        #format.json { render json: @student.errors, status: :unprocessable_entity } //TODO: fix
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update

     #binding.pry
    
    @student = Student.find(student_params[:id])
    
     #binding.pry

    match = Course.find_by(:code => params[:student][:course_code])

     #binding.pry

    if match
      @student.courses << match
    end

     #binding.pry

    respond_to do |format|
      if @student.update(student_params)
         #binding.pry
        format.html { redirect_to @student, notice: 'Student was successfully updated' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    respond_to do |format|
      session[:user_id] = nil #using session.clear interfered with flash messages being displayed
      format.html { redirect_to root_path, notice: 'Come back soon!'}
      format.json { head :no_content }#//TODO correct this
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:user_name, :id, :password_digest, :first_name, :last_name, :email, :type)
    end

end