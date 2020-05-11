class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all
  end

  def show; end

  def new
    @response = Response.new
  end

  def edit; end

  def create
    @response = Response.new(response_params)
    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created' }
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
      params.require(:response).permit(:interaction_id, :user_id, :type, :content, :score, :letter_grade)
    end
end
