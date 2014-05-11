class DeviationsController < ApplicationController
  before_action :require_logged_in!, except: [ :index, :show ]

  def index
    @deviations = Deviation.limit(30).all(order: "created_at DESC")
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
      puts tag_params[:tags]
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
