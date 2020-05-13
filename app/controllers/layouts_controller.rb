class LayoutsController < ApplicationController
    
    def index
        if logged_in?
            @courses = Course.all
        else
            redirect_to welcome_path
        end
    end

    def welcome
        @courses = Course.all
    end

end
