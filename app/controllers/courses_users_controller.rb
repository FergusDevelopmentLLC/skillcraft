class CoursesUsersController < ApplicationController
  before_action :set_courses_user, only: [:destroy]

  def destroy
    @courseUser.delete
    respond_to do |format|
      notice = "#{@courseUser.user.user_name} was successfully removed from #{@courseUser.course.name}"
      if @courseUser.user.type == "Student"
        format.html { redirect_to student_url(@courseUser.user), notice: notice}
      else
        format.html { redirect_to teacher_url(@courseUser.user), notice: notice}
      end
    end
  end

  private
  
  def set_courses_user
    if params[:student_id]
      @courseUser = CoursesUser.find_by(:course_id => params[:course_id], :user_id => params[:student_id])
    else
      @courseUser = CoursesUser.find_by(:course_id => params[:course_id], :user_id => params[:teacher_id])
    end
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :code)
  end
  
end
