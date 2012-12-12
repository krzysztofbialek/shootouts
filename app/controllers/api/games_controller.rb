class Api::GamesController < ApplicationController
  respond_to :json

  def create
    game  = Game.new
    render :json => game.to_json
  end

end
