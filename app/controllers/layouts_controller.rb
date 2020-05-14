class LayoutsController < ApplicationController

  def index

    if logged_in?
    
      @interactions = []

      # teachers create interactions
      current_user.interactions.each do |interaction|
        @interactions.push interaction  
      end
      
      # students have interactions through their courses
      current_user.courses.each do |course|
        if !course.interactions.empty?
          course.interactions.each do |interaction|
            @interactions.push interaction unless @interactions.include?(interaction)
          end
        end
      end
  
    else
      redirect_to welcome_path
    end
  end
    
  def welcome
    @courses = Course.where(featured: true)
  end

end
