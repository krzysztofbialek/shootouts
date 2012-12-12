class Game
  require 'json'

  cattr_accessor :games
  attr_accessor :winner, :num, :shots, :start_with

  @@games = {}

  def initialize
    @num  = @@games.size
    @start_with = rand(2) == 1? 'shot' : 'save'
    @shots = {}
    
    @@games.merge!(@@games.size => self)
  end

  def as_json(options={})
    { :num => self.num,
      :start_with => self.start_with
    }
  end

end
