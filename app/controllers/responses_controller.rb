class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all
    @index_title = "Responses"
    @responses = if request.path.include?("questions")
                  @index_title = "Questions"
                  Question.all
                 elsif request.path.include?("completed_assignments")
                  @index_title = "Completed Assignments"
                  CompletedAssignment.all
                 else
                  Response.all #TODO: necessary?
                 end
  end

  def show
    if @response.type == "CompletedAssignment" && @response.user != current_user
      respond_to do |format|
        format.html { redirect_to @response.interaction.course, notice: "Viewing other students work is not permited." } 
      end
    end
  end

  def edit; end

  def new
    if params[:announcement_id]
      @response = Question.new
      @response.interaction_id = params[:announcement_id]
    elsif params[:assignment_id]
      @response = CompletedAssignment.new
      @response.interaction_id = params[:assignment_id]
    else
      @response = Response.new
      @response.interaction_id = params[:interaction_id]
    end
    @response.user = current_user if logged_in?
  end

  def create
    @response = Response.new(response_params)
    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: "Creation successful" }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: "Update successful" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @response.destroy
        format.html { redirect_to @response.interaction.course, notice: 'Deletion successful' }
      else
        format.html { redirect_to @response.interaction.course, notice: 'Error on deletion' }
      end
    end
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      if params[:question]
        params.require(:question).permit(:interaction_id, :user_id, :type, :title, :content, :score, :letter_grade)
      elsif params[:completed_assignment]
        params.require(:completed_assignment).permit(:interaction_id, :user_id, :type, :title, :content, :score, :letter_grade)
      else
        params.require(:response).permit(:interaction_id, :user_id, :type, :title, :content, :score, :letter_grade)
      end
    end
end
