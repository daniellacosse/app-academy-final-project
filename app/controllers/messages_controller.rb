class MessagesController < ApplicationController
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

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render :show
    else
      flash.now[:errors] = @message.errors.full_messages
      render :new
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      render :show
    else
      flash.now[:errors] = @message.errors.full_messages
      render :edit
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :body, :user_id, :author_id)
  end
end
