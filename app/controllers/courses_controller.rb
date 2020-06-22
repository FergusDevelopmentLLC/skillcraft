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
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Updated successful' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @course.destroy
        format.html { redirect_to courses_url, notice: 'Deletion successful' }
      else
        format.html { redirect_to courses_url, notice: 'Error on course deletion' }
      end
    end
  end

  def render_index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def free
    @courses = Course.free
    render_index
  end

  def featured
    @courses = Course.featured
    render_index
  end

  def featured_free
    @courses = Course.featured.free
    render_index
  end

  def courses_for_teacher
    @courses = Teacher.find(params[:teacher_id]).courses
    render_index
  end

  def courses_for_student
    @courses = Student.find(params[:student_id]).courses
    render_index
  end

  private
  
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :image_url, :tuition_cost, :code, :featured, :short_desc, :long_desc, comments_attributes: [:id, :user_id, :course_id, :content])
  end

end
