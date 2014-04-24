class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      case comment.commentable_type
        when "Deviation"
          user_id, type = Deviation.find(comment.commentable_id).user, 4
        when "Journal"
          user_id, type = Journal.find(comment.commentable_id).user, 5
        when "Comment"
          user_id, type = Comment.find(comment.commentable_id).commenter, 6
      end

      Notification.create(
        notification_type: type,
        notifier_id: comment.commenter.id,
        user_id: user_id,
        notifiable_id: comment.id,
        notifiable_type: "Like"
      )
    else
      flash[:errors] << @comment.errors.full_messages
    end

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