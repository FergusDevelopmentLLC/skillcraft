class LayoutsController < ApplicationController
    
    def index; end

    def choice
        @user = User.new
    end

end
