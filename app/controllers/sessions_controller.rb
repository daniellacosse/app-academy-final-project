class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:user])

    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def fb_create
    @user = User.find_or_create_by_auth_hash(request.env['omniauth.auth'])

    login(@user)
    redirect_to user_url(@user)
  end

  def destroy
    logout

    redirect_to :root
  end
end