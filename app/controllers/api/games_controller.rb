class Api::GamesController < ApplicationController
  respond_to :json

  def show
    game = Game.find(params[:id])
    render :json => game.to_json
  end

  def create
    game  = Game.new
    render :json => game.to_json
  end

  def shot
    game = Game.find(params[:id])
    game.create_action(params[:x], params[:y], game.current_action)
    
    render :json => game.to_json
  end

end
