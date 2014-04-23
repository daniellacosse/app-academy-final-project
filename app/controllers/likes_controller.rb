class LikesController < ApplicationController
  def create
    Like.create(like_params)

    redirect_to :back
  end

  def destroy
    like = Like.find_by(like_params)

    like.destroy

    redirect_to :back
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_type, :likeable_id)
  end
end
