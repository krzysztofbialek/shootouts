require 'test_helper'

class GamesTest < ActionController::IntegrationTest
  
  def teardown
    Game.games = {}
  end
  
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

  should 'update current_action after shot' do
    game = Game.new
    old_action = game.current_action
    post api_game_shot_url(game.num, :x => 1, :y => 2), :format => :json
    assert_not_equal old_action, JSON.parse(response.body)['current_action']
  end

  should 'respond with message that there is a winner for ended games' do
    game = Game.new
    10.times do
      post api_game_shot_url(game.num, :x => 1, :y => 2), :format => :json
    end
    post api_game_shot_url(game.num, :x => 1, :y => 2), :format => :json
    assert_response :success
    assert_equal "this game has been won by #{game.winner}", JSON.parse(response.body)['message']
  end
  
end
