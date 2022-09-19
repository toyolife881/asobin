class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :find_params, only: :show

  def show
    if current_user.id == @user.id
    @user_child_ages = @user.user_child_ages
    @plays = @user.plays
    @favorite_plays = @user.favorite_plays
    @achivement_plays = @user.achivement_plays
    @plays_count = AchivementPlay.where(user_id: @user.id).count
    @month_record = @user.achivement_plays.group("YEAR(created_at)").group("MONTH(created_at)").count
    @achivement_plays_count = @achivement_plays.joins(:play).group(:play_category_id).count
    else
      redirect_to root_path
    end
  end

  private
  
  def find_params
    @user = User.find(params[:id])
  end

end
