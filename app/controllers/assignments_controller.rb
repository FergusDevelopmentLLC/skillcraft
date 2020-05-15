class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  
    def index
      @assignments = Assignment.all
    end
  
    def show
    end
  
    def new
      @assignment = Assignment.new
      @assignment.course_id = params[:course_id] if params[:course_id]
      @assignment.user = current_user if logged_in?
    end
  
    def edit

    end
  
    def create
      @assignment = Assignment.new(assignment_params)
      respond_to do |format|
        if @assignment.save
          format.html { redirect_to @assignment, notice: 'Creation successful' }
        else
          format.html { render :new }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @assignment.update(assignment_params)
          format.html { redirect_to @assignment, notice: 'Update successful' }
        else
          format.html { render :edit }
        end
      end
    end
  
    def destroy
      @assignment.destroy
      respond_to do |format|
        format.html { redirect_to assignments_url, notice: 'Deletion' }
      end
    end
  
    private
    
      def set_assignment
        @assignment = Assignment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def assignment_params
        params.require(:assignment).permit(:course_id, :user_id, :type, :title, :posted_date, :due_date, :graded, :points, :instructions)
      end
  end
  