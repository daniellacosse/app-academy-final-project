class JournalsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @journals = @user.journals
  end

  def new
    @journal = Journal.new
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def create
    @journal = Journal.new(journal_params)
    if @journal.save
      render :show
    else
      flash.now[:errors] = @journal.errors.full_messages
      render :new
    end
  end

  def update
    @journal = Journal.find(params[:id])
    if @journal.update_attributes(journal_params)
      render :show
    else
      flash.now[:errors] = @journal.errors.full_messages
      render :edit
    end
  end

  private
  def journal_params
    params.require(:journal).permit(:title, :body, :user_id)
  end
end
