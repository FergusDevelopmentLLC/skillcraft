class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]

  def index
    @index_title = title_by_path
    @interactions = interactions_by_path
  end

  def assignments_for
    
    course = Course.find(params['course_id'])
    @interactions = Assignment.for_course(course)
    @index_title = "Assignments for #{course.name}"
    
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    #TODO: better to formulate this here instead of the view?
    #@children_label = @interaction.responses.first.type.pluralize.split(/(?=[A-Z])/).join(' ') unless @interaction.responses.empty?
  end

  def new

    @interaction = if title_by_path == "Announcements"
                     Announcement.new
                   elsif title_by_path == "Assignments"
                     Assignment.new
                   else
                     Interaction.new
                   end

    @interaction.course_id = params[:course_id] if params[:course_id]
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
      if @interaction.type == "Assignment"
      format.html { redirect_to assignments_url, notice: 'Deletion successful' }
      elsif @interaction.type == "Announcement"
      format.html { redirect_to announcements_url, notice: 'Deletion successful' }
      else
      format.html { redirect_to interactions_url, notice: 'Deletion successful' }
      end
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

    def title_by_path
      if request.path.include?("announcements")
        "Announcements"
      elsif request.path.include?("assignments")
        "Assignments"
      else
       "Interactions"
      end
    end
  
    def interactions_by_path
      if title_by_path == "Announcements"
        Announcement.all
      elsif title_by_path == "Assignments"
        c = Course.second
        Assignment.for_course(c)
      else
        Interaction.all
      end
    end
    
end
