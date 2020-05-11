class CourseUsersController < ApplicationController
  before_action :set_course_user, only: [:destroy]

  def destroy
    @courseUser.delete
    respond_to do |format|
      if @courseUser.user.type == "Student"
        format.html { redirect_to student_url(@courseUser.user), notice: @courseUser.user.user_name + " successfully removed from #{@courseUser.course.name}"}
      else
        format.html { redirect_to teacher_url(@courseUser.user), notice: @courseUser.user.user_name + " successfully removed from #{@courseUser.course.name}"}
      end
    end
  end

  private
    def set_course_user
      if params[:student_id]
        @courseUser = CourseUser.find_by(:course_id => params[:course_id], :user_id => params[:student_id])
      else
        @courseUser = CourseUser.find_by(:course_id => params[:course_id], :user_id => params[:teacher_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :code)
    end
end
