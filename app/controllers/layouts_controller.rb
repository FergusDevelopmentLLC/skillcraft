class LayoutsController < ApplicationController
  def index
    redirect_to welcome_path unless logged_in?
  end

  def welcome
    @courses = Course.where(featured: true)
  end
end
