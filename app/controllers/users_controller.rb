class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)

      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.destroy

    logout

    redirect_to new_session_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :username,
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :gender,
        :date_of_birth,
        :country,
        :biography,
        :avatar
      )
    end
end
