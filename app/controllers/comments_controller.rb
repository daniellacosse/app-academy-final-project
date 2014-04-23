class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)

    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(
      :body,
      :user_id,
      :commentable_type,
      :commentable_id
    )
  end
end