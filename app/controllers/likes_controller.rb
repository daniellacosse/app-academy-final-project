class LikesController < ApplicationController
  def create
    like = Like.create(like_params)

    case like.likeable_type
      when "User"
        user_id, type = like.likeable_id, 1
      when "Deviation"
        user_id, type = Deviation.find(like.likeable_id).user.id, 2
      when "Gallery"
        user_id, type = Gallery.find(like.likeable_id).user.id, 3
    end

    Notification.create(
      notification_type: type,
      notifier_id: like.liker.id,
      user_id: user_id,
      notifiable_id: like.id,
      notifiable_type: "Like"
    )

    redirect_to :back
  end

  def destroy
    like = Like.find_by(like_params)

    like.destroy

    redirect_to :back
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_type, :likeable_id)
  end
end
