class FavoritePlaysController < ApplicationController
  def create
    @favorite_play = FavoritePlay.create(user_id: current_user.id, play_id: params[:play_id])
    redirect_to play_path(@favorite_play.play_id)
  end

  def destroy
    @favorite_play = FavoritePlay.find_by(user_id: current_user.id, play_id: params[:play_id])
    @favorite_play.destroy
    redirect_to play_path(@favorite_play.play_id)
  end
end
