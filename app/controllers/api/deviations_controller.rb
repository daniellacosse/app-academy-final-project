class Api::DeviationsController < ApplicationController
  before_action :require_logged_in!, except: [ :index, :show ]

  def index
    @deviations = Deviation.all(order: "created_at DESC")

    render json: @deviations.to_json
  end

  def new
    @deviation = Deviation.new

    render json: @deviation.to_json
  end

  def edit
    @deviation = Deviation.find(params[:id])
  end

  def create
    p deviation_params
    p deviation_params[:media]
    @deviation = Deviation.new(deviation_params)
    if @deviation.save
      tag_params[:tags].split(/ |,/).reject{ |el| el.empty? }.each do |tag|
        Tag.create({
          tag: tag,
          taggable_id: @deviation.id,
          taggable_type: "Deviation"
        })
      end

      current_user.followers.each do |follower|
        Notification.create(
          notification_type: 7,
          notifier_id: current_user.id,
          user_id: follower.id,
          notifiable_id: @deviation.id,
          notifiable_type: "Deviation"
        )
      end

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

  def destroy
    @deviation = Deviation.find(params[:id])

    @deviation.destroy

    redirect_to user_url(@deviation.user_id)
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

  def tag_params
    params.require(:deviation).permit(:tags)
  end
end
