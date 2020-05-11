class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  def index
    @interactions = Interaction.all
  end

  def show
  end

  def new
    @interaction = Interaction.new
  end

  def edit
  end

  def create
    @interaction = Interaction.new(interaction_params)

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to @interaction, notice: 'Interaction was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to @interaction, notice: 'Interaction was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to interactions_url, notice: 'Interaction was successfully destroyed' }
    end
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interaction_params
      params.require(:interaction).permit(:course_id, :user_id, :type, :title, :start_date, :end_date, :posted_date, :due_date, :graded, :points, :instructions)
    end
end
