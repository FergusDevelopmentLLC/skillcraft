class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception #???

  helper_method :logged_in?
  helper_method :current_user
  helper_method :is_student?
  helper_method :is_teacher_of?
  helper_method :is_enrolled_in?

  # helper_method :teaching?

  private

  def logged_in?
    !!current_user
  end

  def is_student?
    if @current_user && @current_user.type == "Student"
      true
    else
      false
    end
  end
    
  def current_user
    @current_user ||= User.find_by(:id => session[:user_id])
  end

  def is_teacher_of?(course)
    @current_user && !course.teachers.empty? && course.teachers.first == @current_user
  end

  def is_enrolled_in?(course)
    @current_user && !course.students.empty? && course.students.include?(@current_user)
  end

end