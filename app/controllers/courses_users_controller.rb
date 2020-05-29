class CoursesUsersController < ApplicationController
  before_action :set_courses_user, only: [:destroy]

  def destroy
    respond_to do |format|
      student_comment = Comment.find_by(user: @courseUser.user, course: @courseUser.course)
      if @courseUser.delete && student_comment && student_comment.delete
        format.html { redirect_to @courseUser.course, notice: "#{@courseUser.user.user_name} was successfully removed from #{@courseUser.course.name}" }
      else
        format.html { redirect_to @courseUser.course, notice: "#{@courseUser.user.user_name} removal unsuccessful." }
      end
    end
  end

  private
  def set_courses_user
    user_id = params[:student_id] ? params[:student_id] : params[:teacher_id]
    @courseUser = CoursesUser.find_by(course_id: params[:course_id], user_id: user_id)
  end
end
