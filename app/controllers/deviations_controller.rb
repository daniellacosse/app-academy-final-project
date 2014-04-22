class DeviationsController < ApplicationController
  def index
    @deviations = Deviation.all
  end

  def new
    @deviation = Deviation.new
  end

  def show
    @deviation = Deviation.find(params[:id])
  end

  def edit
    @deviation = Deviation.find(params[:id])
  end

  def create
    @deviation = Deviation.new(deviation_params)
    fail
    if @deviation.save
      render @deviation
    else
      flash.now[:errors] = @deviation.errors.full_messages
      render :new
    end
  end

  def update
    @deviation = Deviation.new(deviation_params)
    if @deviation.update
      render @deviation
    else
      flash.now[:errors] = @deviation.errors.full_messages
      render :edit
    end
  end

  private
  def deviation_params
    params.require(:deviation).permit(
      :title,
      :description,
      :user_id,
      :is_commentable,
      :is_likeable,
      :is_shareable,
      :is_mature,
      :is_CC,
      :is_DRM
    )
  end
end
