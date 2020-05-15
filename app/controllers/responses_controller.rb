class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all
  end

  def show; end

  def new
    
    if params[:announcement_id]
      @response = Question.new
      @response.interaction_id = params[:announcement_id] if params[:announcement_id]
      @response.user = current_user if logged_in?
    else
      @response = Response.new
      @response.interaction_id = params[:interaction_id] if params[:interaction_id]
      @response.user = current_user if logged_in?
    end

  end

  def edit; end

  def create
    @response = Response.new(response_params)
    respond_to do |format|
      if @response.save
        if @response.type == "Question"
          format.html { redirect_to questions_path(@response), notice: 'Your question was successfully created' }
        else
          format.html { redirect_to responses_url(@response), notice: 'Your response was successfully created' }
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed' }
    end
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      if params[:question]
        params.require(:question).permit(:interaction_id, :user_id, :type, :content)
      else
        params.require(:response).permit(:interaction_id, :user_id, :type, :title, :content, :score, :letter_grade)
      end
    end
end
