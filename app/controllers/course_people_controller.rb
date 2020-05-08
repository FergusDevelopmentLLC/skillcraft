class CoursePeopleController < ApplicationController
  before_action :set_course_person, only: [:destroy]

  # DELETE /course_people/1
  # DELETE /course_people/1.json
  def destroy
    @coursePerson.delete
    respond_to do |format|
      format.html { redirect_to course_url(@coursePerson.course), notice: @coursePerson.person.user_name + " successfully removed from #{@coursePerson.course.name}"}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_person
      if params[:student_id]
        @coursePerson = CoursePerson.find_by(:course_id => params[:course_id], :person_id => params[:student_id])
      else
        @coursePerson = CoursePerson.find_by(:course_id => params[:course_id], :person_id => params[:teacher_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :code)
    end
end
