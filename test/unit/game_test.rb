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
end
