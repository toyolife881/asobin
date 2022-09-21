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
    @achivement_plays_count = @achivement_plays.joins(:play).group(:play_category_id).count
    @month_record = @user.achivement_plays.group("YEAR(created_at)").group("MONTH(created_at)").count
    achivement_plays_monthly
    else
      redirect_to root_path
    end
  end

  private
  
  def find_params
    @user = User.find(params[:id])
  end

  # 今月〜半年前までの遊んだ実績を抽出
  def achivement_plays_monthly
    @achivement_plays_month = @achivement_plays.where(created_at: Time.now.in_time_zone.all_month) 
    @achivement_plays_month_1ago = @achivement_plays.where(created_at: Time.now.ago(1.month).in_time_zone.all_month) 
    @achivement_plays_month_2ago = @achivement_plays.where(created_at: Time.now.ago(2.month).in_time_zone.all_month) 
    @achivement_plays_month_3ago = @achivement_plays.where(created_at: Time.now.ago(3.month).in_time_zone.all_month) 
    @achivement_plays_month_4ago = @achivement_plays.where(created_at: Time.now.ago(4.month).in_time_zone.all_month) 
    @achivement_plays_month_5ago = @achivement_plays.where(created_at: Time.now.ago(5.month).in_time_zone.all_month) 
  end

end
