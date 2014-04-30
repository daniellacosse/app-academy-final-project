class Api::JournalsController < ApplicationController
  before_action :require_logged_in!, only: [:new, :create, :edit, :update]

  def index
    @user = User.find(params[:user_id])
    @journals = @user.journals

    render json: @journals
  end

  def new
    @journal = Journal.new

    render json: @journal
  end

  def show
    @journal = Journal.find(params[:id])
    @user = @journal.user

    render json: @journal
  end

  def edit
    @journal = Journal.find(params[:id])

    render json: @journal
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      tag_params[:tags].split(/ |,/).reject{ |el| el.empty? }.each do |tag|
        Tag.create({
          tag: tag,
          taggable_id: @journal.id,
          taggable_type: "Journal"
        })
      end

      current_user.followers.each do |follower|
        Notification.create(
          notification_type: 8,
          notifier_id: current_user.id,
          user_id: follower.id,
          notifiable_id: @journal.id,
          notifiable_type: "Journal"
        )
      end

      head :ok
    else
      flash.now[:errors] = @journal.errors.full_messages
    end
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(journal_params)
      head :ok
    else
      flash.now[:errors] = @journal.errors.full_messages
    end
  end

  def destroy
    @journal = Journal.find(params[:id])

    @journal.destroy

    redirect_to user_url(@journal.user_id)
  end

  private
  def journal_params
    params.require(:journal).permit(:title, :body, :user_id)
  end

  def tag_params
    params.require(:journal).permit(:tags)
  end
end
