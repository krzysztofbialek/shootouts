class Game
  require 'json'

  cattr_accessor :games
  attr_accessor :winner, :num, :shots, :current_action

  @@games = {}

  def initialize
    @num  = @@games.size
    @current_action = rand(2) == 1? 'shot' : 'save'
    @shots = {}
    
    @@games.merge!(@@games.size => self)
  end

  def self.find(param)
    game = @@games[param.to_i]
  end

  def create_action(x, y, type)
    shot = Action.new(x, y, type)
    shots.merge!(shots.size => shot)
  end

  def as_json(options={})
    { :num => self.num,
      :current_action => self.current_action,
      :shots => self.shots
    }
  end

end
