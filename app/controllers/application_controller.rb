class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :has_notifications?

  def current_user
    User.find_by(token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def has_notifications?
    return false unless logged_in?

    current_user.unseen_notifications.count > 0 ? true : false
  end

  def login(user)
    user.reset_token!
    session[:token] = user.token
  end

  def logout
    current_user.reset_token!
    session[:token] = nil
  end

  def require_logged_in!
    unless logged_in? && current_user.is_verified
      flash[:errors] = ["You gotta be a verified user to do that!"]

      redirect_to :back
    end
  end
end
