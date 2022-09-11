class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :find_params, only: :show

  def show
    if current_user.id == @user.id
    @child_ages = @user.user_child_ages
    @plays = @user.play
    @favorite_plays = @user.favorite_play
    else
      redirect_to root_path
    end
  end

  private
  
  def find_params
    @user = User.find(params[:id])
  end

end
