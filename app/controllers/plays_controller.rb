class PlaysController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @plays = Play.all.order('created_at DESC')
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @play = Play.find(params[:id])
  end

  private

  def play_params
    params.require(:play).permit(:image, :play_name, :preparation, :how_to_play, :play_category_id, :target_age_id, :estimated_time_id).merge(user_id: current_user.id)
  end

end
