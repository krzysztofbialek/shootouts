class Game

  cattr_accessor :games

  @@games = {}

  def initialize
    @@games.merge!(@@games.size => self)
  end

end
