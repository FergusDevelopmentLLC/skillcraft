class AnnouncementsController < ApplicationController
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  
    def index
      @announcements = Announcement.all
    end
  
    def show
    end
  
    def new
      @announcement = Announcement.new
      @announcement.course_id = params[:course_id] if params[:course_id]
      @announcement.user = current_user if logged_in?
    end
  
    def edit
    end
  
    def create
      
      @announcement = Announcement.new(announcement_params)
      
      respond_to do |format|
        if @announcement.save
          format.html { redirect_to @announcement, notice: "Creation successful" }
        else
          format.html { render :new }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @announcement.update(announcement_params)
          format.html { redirect_to @announcement, notice: "Update successful" }
        else
          format.html { render :edit }
        end
      end
    end
  
    def destroy
      @announcement.destroy
      respond_to do |format|
        format.html { redirect_to announcements_url, notice: "Deletion successful" }
      end
    end
  
    private

      def set_announcement
        @announcement = Announcement.find(params[:id])
      end
  
      def announcement_params
        params.require(:announcement).permit(:course_id, :user_id, :type, :title, :posted_date, :due_date, :graded, :points, :instructions)
      end
  end
