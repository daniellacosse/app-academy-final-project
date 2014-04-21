class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(
      username: params[:user][:username],
      password: params[:user][:password]
    )

    if user
      login(user)
    else
      flash.now[:errors] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    logout
  end
end