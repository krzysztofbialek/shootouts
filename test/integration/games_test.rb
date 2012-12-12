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
    assert_equal game.current_action, new_game['current_action']
  end

  should 'repsond to show action' do
    game = Game.new
    get api_game_url(game.num), :format => :json
    new_game = JSON.parse(response.body)
    assert_equal game.num, new_game['num']
    assert_equal game.current_action, new_game['current_action']
  end

  should 'create new action and respond with result' do
    game = Game.new
    post api_game_shot_url(game.num, :x => 1, :y => 2), :format => :json
    assert_response :success
    shots = JSON.parse(response.body)['shots']
    result = shots['0']['result']
    assert ['miss', 'goal'].include?(result)
  end
  
end
