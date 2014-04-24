class NotificationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notifications = @user.notifications

    user.has_seen_notifications
  end
end