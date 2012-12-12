require 'test_helper'

class GamesTest < ActionController::IntegrationTest
  
  should 'create new game' do
    post api_games_url, :format => :json
    assert_response :success
  end

  should 'respond with valid game' do
    post api_games_url, :format => :json
    new_game = JSON.parse(response.body)
    game = Game.games[new_game['num']]
    assert_equal game.num, new_game['num']
    assert_equal game.start_with, new_game['start_with']
  end
  
end
