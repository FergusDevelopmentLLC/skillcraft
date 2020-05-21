class LayoutsController < ApplicationController

  def index

    if logged_in?
    
      @interactions = []

      # teachers create interactions (announcements and assignments)
      current_user.interactions.each do |interaction|
        @interactions.push interaction  
      end
      
      # students have interactions (questions and completed_assignments) through their courses
      current_user.courses.each do |course|
        if !course.interactions.empty?
          course.interactions.each do |interaction|
            @interactions.push interaction unless @interactions.include?(interaction)
          end
        end
      end

      @interactions = @interactions.sort_by(&:activity_date)

    else
      redirect_to welcome_path
    end
  end
    
  def welcome
    @courses = Course.where(featured: true)
  end

end
