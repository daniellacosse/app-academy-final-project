class DeviationsController < ApplicationController
  def index
    @deviations = Deviation.all(order: "created_at DESC")
  end

  def new
    @deviation = Deviation.new
  end

  def show
    @deviation = Deviation.find(params[:id])
    unless !logged_in? || current_user.id == @deviation.user.id
      View.create({
        user_id: current_user.id,
        viewable_id: @deviation.id,
        viewable_type: "Deviation"
      })
    end
  end

  def edit
    @deviation = Deviation.find(params[:id])
  end

  def create
    @deviation = Deviation.new(deviation_params)
    if @deviation.save
      render :show
    else
      flash.now[:errors] = @deviation.errors.full_messages
      render :new
    end
  end

  def update
    @deviation = Deviation.find(params[:id])
    if @deviation.update_attributes(deviation_params)
      render :show
    else
      flash.now[:errors] = @deviation.errors.full_messages
      render :edit
    end
  end

  private
  def deviation_params
    params.require(:deviation).permit(
      :media,
      :title,
      :description,
      :user_id,
      :is_commentable,
      :is_likeable,
      :is_shareable,
      :is_mature,
      :is_CC,
      :is_DRM,
      :can_remix
    )
  end
end
