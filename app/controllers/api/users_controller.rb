class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    render partial: "users/user.json.jbuilder"
  end

  def edit
    @user = User.find(params[:id])

    render json: @user.includes(:deviations, :journals, :galleries).to_json
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
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
