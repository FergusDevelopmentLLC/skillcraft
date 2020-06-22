# rubocop:disable ClassLength
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :randomize_avatar]	
  
  def new
    @user = User.new
    @select_users = User.teacher_student
  end

  def show
    @user = User.find(params[:id])
  end

  def signin
    @select_users = User.teacher_student
  end

  def index
    
    @users ||= if request.path == "/students"
                @courses_title = "Courses enrolled"
                Student.all
               else
                @courses_title = "Courses taught"  
                Teacher.all
               end
          
  end
    
  def render_index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def students_for_course
    @course = Course.find_by(:id => params[:course_id])
    @users = @course.students
    @courses_title = "Courses enrolled"
    render_index
  end
  
  def post_signin
    @user = User.find_by(:user_name => params[:user_name])

    # TODO: do this better somehow
    p = nil
    begin
      p = @user.authenticate(params[:password])
    rescue
      p = nil
    end

    if(@user && p)
        respond_to do |format|
          session[:user_id] = @user.id
          format.html { redirect_to courses_path, notice: 'Welcome to SkillCraft, a place to craft your skills'}
        end
    else
        respond_to do |format|
          format.html { redirect_to signin_path, notice: 'User name or password incorrect'}
        end
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.avatar = Avatar.unused_avatar
    unless params[:code].blank?
      match = Course.find_by(:code => params[:code]) #TODO: is this unprotected?
      if match
        @user.courses << match unless @user.courses.include?(match)
      else
        @user.validate
        @user.errors.add(:course, 'code incorrect')
      end
    end
    if @user.save
      path = @user.type == "Student" ? student_path(@user) : teacher_path(@user)
      redirect_to path, notice: "#{@user.type} was successfully created"
    else #if they entered a course code, repopulate form
      @course_code = match.code if match
      @select_users = User.teacher_student
      respond_to do |format|
        format.html { render :new }
      end
    end
  end

  def update
    @user.attributes = user_params
    unless params[:code].blank?
      match = Course.find_by(:code => params[:code]) #TODO: is this unprotected?
      if match
        @user.courses << match unless @user.courses.include?(match)
      else
        @user.validate
        @user.errors.add(:course, 'code incorrect')
      end
    end
    respond_to do |format|
      if @user.errors.count.zero? && @user.save
        format.html { redirect_to @user, notice: "#{@user.user_name} was successfully updated" }
      else
        @course_code = match.code if match
        format.html { render :edit }
      end
    end
  end

  def signout
    
    respond_to do |format|
      session[:user_id] = nil #using session.clear interfered with flash messages being displayed
      format.html { redirect_to root_path, notice: 'Come back soon!'}
    end

  end
  
  def randomize_avatar 
    @user.avatar = Avatar.unused_avatar
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: "#{@user.user_name} was successfully updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
    respond_to do |format|
      if logged_in? && @user == current_user
        @user = @user.becomes(User)
        format.html { render :edit }
      else
        format.html { redirect_to user_path(@user), notice: "Users cannot edit others" }
      end
    end
  end

  def destroy
    respond_to do |format|
      @user.destroy
      if @user.type == "Student"
        format.html { redirect_to students_url, notice: "Deletion successful" }
      else
        format.html { redirect_to teachers_url, notice: "Deletion successful" }
      end
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
        
    # Only allow a list of trusted parameters through.
    def user_params
      if params[:teacher]
        params.require(:teacher).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
      elsif params[:student]
        params.require(:student).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)          
      elsif params[:user]
        params.require(:user).permit(:user_name, :id, :password, :first_name, :last_name, :email, :type)
      end
    end

end
# rubocop:enable ClassLength