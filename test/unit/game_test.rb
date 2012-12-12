require 'test_helper'

class GameTest < Test::Unit::TestCase

 should "games hash should be empty at start of server" do
  
   assert @@games.empty? 
  
 end 


end
