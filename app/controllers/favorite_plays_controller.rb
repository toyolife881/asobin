class FavoritePlaysController < ApplicationController
  def create
    FavoritePlay.create(user_id: current_user.id, play_id: params[:id:])
    redirect_to play_path(params[:id])
  end

  def destroy
    favorite_play = FavoritePlay.find_by(user_id: current_user.id, play_id: params[:id])
    favorite_play.destroy
    redirect_to root_path
  end
end
