class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.course, notice: 'Comment was successfully created' }
      else
        format.html { redirect_to @comment.course, notice: 'Comment save unsuccessful' }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.course, notice: 'Update successful' }
      else
        format.html { redirect_to @comment.course, notice: 'Deletion unsuccessful' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to @comment.course, notice: 'Update successful' }
      else
        format.html { redirect_to @comment.course, notice: 'Deletion unsuccessful' }
      end
    end
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:user_id, :course_id, :content)
  end

end
