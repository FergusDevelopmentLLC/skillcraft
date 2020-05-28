class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @comment = Comment.find_by(user: current_user, course: @course)
  end

  def new
    @course = Course.new
    @course.code ||= @course.code = 4.times.map{rand(4)}.join
  end

  def edit; end

  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @course.update(course_params)
      if @course.save
        format.html { redirect_to @course, notice: 'Updated successful' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Deletion successful' }
    end
  end

  def choose_course
    @courses = Course.all
    respond_to do |format|
      format.html { render template: 'courses/index' }
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :code, :featured, :short_desc, :long_desc, comments_attributes: [:id, :user_id, :course_id, :content])
    end
end
