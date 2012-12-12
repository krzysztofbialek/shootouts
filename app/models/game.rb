class Game

  cattr_accessor :games
  attr_accessor :winner, :num, :shots, :start_with

  @@games = {}

  def initialize
    @num  = @@games.size
    @start_with = rand(2) == 1? 'shot' : 'save'
    @shots = {}
    
    @@games.merge!(@@games.size => self)
  end

end
