class LikesController < ApplicationController
  def create

    Like.create({

    })

    head :ok
  end

  def destroy
    like = Like.find_by({

    })

    like.destroy

    head :ok
  end

end
