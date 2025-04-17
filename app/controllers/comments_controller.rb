class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @catch = Catch.find(params[:catch_id])
    @comment = @catch.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to catch_path(@catch), notice: "Comment posted."
    else
      redirect_to catch_path(@catch), alert: "Failed to post Comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
