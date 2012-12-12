require 'test_helper'

class GameTest < Test::Unit::TestCase

  def teardown
    Game.games = {}
  end

  should "create a game and add it to games" do
    Game.new
    assert_equal 1, Game.games.size
  end
  
  should "games hash should be empty at start of server" do
    assert_equal 0, Game.games.size, "Number of games was #{Game.games.size} instead of 0"
  end 

  should "create game with default starting values" do
    game = Game.new
    assert_equal nil, game.winner
    assert ['shot', 'save'].include?(game.start_with), game.start_with
    assert_equal Game.games.size - 1, game.num
  end

end
