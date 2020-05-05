class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    
  end

  # GET /students/new
  def new
    @student = Student.new
    #binding.pry
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    
    @student = Student.find(student_params[:id])
    
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /login
  def login
    
    #one
    
    #binding.pry
    
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
    
    @person = Person.find_by(:user_name => params[:user_name])
    
    if(@person && @person.authenticate(params[:password]))
        respond_to do |format|
          session[:user_id] = @person.id
          format.html { redirect_to courses_path, notice: 'Welcome to SkillCraft.'}
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

  def signup
    # binding.pry
    # respond_to do |format|
    #   format.html { redirect_to new_student_url }
    #   format.json { head :no_content }
    # end
  end

  def logout
    respond_to do |format|
      session[:user_id] = nil #using session.clear interfered with flash messages being displayed
      format.html { redirect_to root_path, notice: 'Logout successful'}
      format.json { head :no_content }#//TODO correct this
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:user_name, :id, :password_digest, :first_name, :last_name, :email, :type)
    end
end
