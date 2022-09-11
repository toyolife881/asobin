class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @child_ages = @user.user_child_ages
    @plays = @user.play
    @favorite_plays = @user.favorite_play
  end
end
