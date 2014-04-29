class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:deviations, :galleries).find(params[:id])

    unless !logged_in? || current_user.id == Integer(params[:id])
      View.create({
        user_id: current_user.id,
        viewable_id: params[:id],
        viewable_type: "User"
      })
    end

    respond_to do |format|
      format.html { render :show }
      format.json { sleep(1); render json: @user.to_json }
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html { render :edit }
      format.json { sleep(1); render json: @user.to_json }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      UserMailer.authentication_email(@user).deliver

      redirect_to user_url(@user)
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
