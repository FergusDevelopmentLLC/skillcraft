class LayoutsController < ApplicationController

  def index

    binding.pry

    if logged_in?
    
      @interactions = []

      binding.pry
  
      # teachers create interactions
      current_user.interactions.each do |interaction|
        @interactions.push interaction  
      end
      
      binding.pry
  
      # students have interactions through their courses
      current_user.courses.each do |course|
        if !course.interactions.empty?
          course.interactions.each do |interaction|
            @interactions.push(interaction)
          end
        end
      end
  
      binding.pry
    else
      redirect_to welcome_path
    end
    
   

  end
    
  def welcome
    @courses = Course.where(featured: true)
  end

end
