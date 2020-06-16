class CoursesUsersController < ApplicationController
  before_action :set_courses_user, only: [:destroy]

  def destroy
    respond_to do |format|
      student_comment = Comment.find_by(user: @courseUser.user, course: @courseUser.course)
      if @courseUser.delete
        
        # TODO: This is a weird one.... if there is a comment found, delete it
        # https://www.rubydoc.info/gems/rubocop/0.43.0/RuboCop/Cop/Style/SafeNavigation
        student_comment&.delete

        #student_comment.delete if student_comment
        
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
