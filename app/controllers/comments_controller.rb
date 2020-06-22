class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_course, only: [:new, :edit]

  def index
    @comments = Comment.where(course_id: params['course_id'])
  end

  def new; end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.course, notice: 'Your course comment was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.course, notice: 'Update successful' }
      else
        @course = Course.find(params[:course_id])
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to @comment.course, notice: 'Deletion successful' }
      else
        format.html { redirect_to course_path(@comment.course), notice: @comment.errors.full_messages.first }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:user_id, :course_id, :content)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
