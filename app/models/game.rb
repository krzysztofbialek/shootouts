class Game
  require 'json'

  cattr_accessor :games
  attr_accessor :winner, :num, :shots, :current_action

  @@games = {}

  def initialize
    @num  = @@games.size
    @current_action = rand(2) == 1? 'shot' : 'save'
    @shots = {}
    @winner = nil
    
    @@games.merge!(@@games.size => self)
  end

  def self.find(param)
    game = @@games[param.to_i]
  end

  def create_action(x, y, type)
    old_action = self.current_action
    shot = Action.new(x, y, type)
    shots.merge!(shots.size => shot)
    self.current_action = (old_action == 'save'? 'shot' : 'save')
    check_if_won? if shots.size == 10
  end

  def check_if_won?
    client = 0
    server = 0
    shots.each_pair do |k,v|
      if v.type == 'save'
        if v.result == 'save'
          client += 1
        else
          server += 1
        end
      else
        if v.result == 'goal'
          client += 1
        else
          server += 1
        end
      end
    end
    self.winner = (client > server)? 'client' : 'server'
  end

  def as_json(options={})
    { :num => self.num,
      :current_action => self.current_action,
      :winner => self.winner,
      :shots => self.shots
    }
  end

end
