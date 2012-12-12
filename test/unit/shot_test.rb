require 'test_helper'

class ActionTest < Test::Unit::TestCase
  
  def teardown
    Game.games = {}
  end

  should 'check if shot was saved' do
    game = Game.new
    game.create_action(2,2,'shot')
    action = game.shots[0]
    assert ['goal', 'save'].include?(action.result)
  end

end
