class GalleriesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @galleries = @user.galleries
  end

  def new
    @gallery = Gallery.new
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      render :show
    else
      flash.now[:errors] = @gallery.errors.full_messages

      render :new
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      render :show
    else
      flash.now[:errors] = @gallery.errors.full_messages

      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])

    @gallery.destroy

    redirect_to user_url(@gallery.user_id)
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :description, :user_id, deviation_ids: [])
  end
end