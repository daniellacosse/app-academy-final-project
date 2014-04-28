class MessagesController < ApplicationController
  before_action :require_logged_in!, only: [:new, :create]

  def index
    @messages = User.find(params[:user_id]).messages
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      Notification.create(
        notification_type: 0,
        notifier_id: @message.author.id,
        user_id: @message.user.id,
        notifiable_id: @message.id,
        notifiable_type: "Message"
      )
      render :show
    else
      flash[:errors] = @message.errors.full_messages

      redirect_to new_user_message_url(@message.user_id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :body, :user_id, :author_id)
  end
end
