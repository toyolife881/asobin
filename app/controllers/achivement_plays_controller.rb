class AchivementPlaysController < ApplicationController

  def create
    @achivement_play = AchivementPlay.create(user_id: current_user.id, play_id: params[:play_id])
    redirect_to play_achivement_plays_path(@achivement_play.play_id)
  end

end
