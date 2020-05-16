class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  def index
    @index_title = "Interactions"
    @interactions = if request.path.include?("announcements")
                      @index_title = "Announcements"
                      Announcement.all
                    elsif request.path.include?("assignments")
                      @index_title = "Assignments"
                      Assignment.all
                    else
                      Interaction.all #TODO: necessary?
                    end
  end

  def show
  end

  def new
    if request.path.include?("announcements")
      @interaction = Announcement.new
      @interaction.course_id = params[:course_id] if params[:course_id]
    elsif request.path.include?("assignments")
      @interaction = Assignment.new
      @interaction.course_id = params[:course_id] if params[:course_id]
    end

    @interaction.user = current_user if logged_in?
  end

  def edit; end

  def create
    @interaction = Interaction.new(interaction_params)

    respond_to do |format|
      if @interaction.save
        format.html { redirect_to @interaction, notice: 'Creation successful' }
      else
        format.html { render :new }
      end
    end

  end

  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to @interaction, notice: 'Update successful' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to interactions_url, notice: 'Deletion successful' }
    end
  end

  private
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interaction_params
      if params[:assignment]
        params.require(:assignment).permit(:course_id, :user_id, :type, :title, :due_date, :graded, :points, :instructions)
      elsif params[:announcement]
        params.require(:announcement).permit(:course_id, :user_id, :type, :title, :due_date, :graded, :points, :instructions)
      end
    end
end
