class LikesController < ApplicationController
  before_action :require_logged_in!

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

    user = User.find(user_id)

    user.notifications.create(
      notification_type: type,
      notifier_id: like.liker.id,
      notifiable_id: like.id,
      notifiable_type: "Like"
    )

    render partial: "likes/button", locals: {
      type: like.likeable_type,
      set: current_user.try(:liked_deviations),
      target: Object.const_get(like.likeable_type).find(like.likeable_id),
      owner: user
    }
  end

  def destroy
    like = Like.find_by(like_params)

    like.destroy

    render partial: "likes/button", locals: {
      type: like.likeable_type,
      set: current_user.try(:liked_deviations),
      target: Object.const_get(like.likeable_type).find(like.likeable_id),
      owner: Object.const_get(like.likeable_type).find(like.likeable_id).user
    }
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_type, :likeable_id)
  end
end
