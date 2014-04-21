class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    user.reset_token!
    session[:token] = user.token
  end

  def logout
    user.reset_token!
    session[:token] = nil
  end
end
