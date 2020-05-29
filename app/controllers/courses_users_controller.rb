class CoursesUsersController < ApplicationController
  before_action :set_courses_user, only: [:destroy]

  def destroy
    @courseUser.delete
    respond_to do |format|
      notice = "#{@courseUser.user.user_name} was successfully removed from #{@courseUser.course.name}"
      format.html { redirect_to @courseUser.course, notice: notice}
    end
  end

  private
  
  def set_courses_user
    user_id = params[:student_id] ? params[:student_id] : params[:teacher_id]
    CoursesUser.find_by(course_id: params[:course_id], user_id: user_id)
  end

end
