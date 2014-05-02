class CommentsController < ApplicationController
  before_action :require_logged_in!

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
        case @comment.commentable_type
          when "Deviation"
            deviation = Deviation.find(@comment.commentable_id)
            # notify_followers_of(deviation, @comment, @comment.commenter, 12)
            user_id, type = Deviation.find(@comment.commentable_id).user.id, 4
          when "Journal"
            user_id, type = Journal.find(@comment.commentable_id).user.id, 5
          when "Comment"
            user_id, type = Comment.find(@comment.commentable_id).commenter.id, 6
        end

        unless @comment.commenter == current_user
          Notification.create(
            user_id: user_id,                   # who is to be notified
            notification_type: type,            # index of message/url to show
            notifier_id: @comment.commenter.id, # id responsible for noteable obj
            notifiable_id: @comment.id,         # id of noteworthy object
            notifiable_type: "Comment"          # type of noteworthy object
          )

        # @comment.notification.create(owner/follower, author, event_index)
        end

        render partial: "comments/comment", locals: {comment: @comment}
    else
      flash.now[:errors] << @comment.errors.full_messages
    end
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

  # THIS SHOULD BE AN ACTION CONTROLLER METHOD, MY GOD
  def notify_followers_of(my, event, author, n)
    my.followers.each do |follower|
      Notification.create(
        user_id: follower.id,
        notification_type: n,
        notifier_id: author.id,
        notifiable_id: event.id,
        notifiable_type: event.class.to_s
      )
    end
  end

  def notify_owner_of(my, event, type, n)
    Notification.create(
      user_id: my.user_id,
      notification_type: n,
      notifier_id: event,
      notifiable_id: my.id,
      notifiable_type: type # "comment", not "deviation"
    )
  end
end