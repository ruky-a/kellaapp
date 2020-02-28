class CommentsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @course.comments.create(comment_params.merge(user: current_user))
    redirect_to course_path(@course)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
