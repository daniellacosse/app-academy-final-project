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

  def destroy
    logout

    redirect_to :root
  end
end