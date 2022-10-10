class PlaysController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @plays_limit10 = Play.all.order('created_at DESC').limit(10)
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
    
  end

  def edit
    if current_user.id != @play.user_id
      redirect_to root_path
    end
  end

  def update
    @play.update(play_params)
    if @play.save
      redirect_to play_path(@play)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @play.user_id
     @play.destroy
     redirect_to root_path
    end
  end

  def list
    @plays = Play.all.order('created_at DESC')
  end

  def outdoor
    @plays = Play.where(play_category_id: 2).order('created_at DESC')
  end

  def indoor
    @plays = Play.where(play_category_id: 3).order('created_at DESC')
  end

  def production
    @plays = Play.where(play_category_id: 4).order('created_at DESC')
  end

  def music
    @plays = Play.where(play_category_id: 5).order('created_at DESC')
  end

  def reading
    @plays = Play.where(play_category_id: 6).order('created_at DESC')
  end

  def game
    @plays = Play.where(play_category_id: 7).order('created_at DESC')
  end

  def sports
    @plays = Play.where(play_category_id: 8).order('created_at DESC')
  end

  def cooking
    @plays = Play.where(play_category_id: 9).order('created_at DESC')
  end

  def others
    @plays = Play.where(play_category_id: 10).order('created_at DESC')
  end


  private

  def play_params
    params.require(:play).permit(:image, :play_name, :preparation, :how_to_play, :play_category_id, :target_age_id, :estimated_time_id).merge(user_id: current_user.id)
  end

  def find_params
    @play = Play.find(params[:id])
  end

end
