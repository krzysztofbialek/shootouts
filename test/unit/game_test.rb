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
    assert ['shot', 'save'].include?(game.current_action), game.current_action
    assert_equal Game.games.size - 1, game.num
  end

  should 'create a shot for itself' do
    game = Game.new
    game.create_action(2,2,'shot')
    assert_equal 1, game.shots.size  
  end

  should 'declare winner after 10 shots' do
    game = Game.new
    10.times do
      game.create_action(2,2, game.current_action)
    end
    assert ['client', 'server'].include?(game.winner), "expected winner to be client or server but was #{game.winner}"
  end
end
