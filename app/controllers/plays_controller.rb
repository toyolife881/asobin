class PlaysController < ApplicationController
  def index
    @plays = Play.all.order('created_at DESC')
  end

  def new
    @play = Play.new
  end

  def create
  end

end
