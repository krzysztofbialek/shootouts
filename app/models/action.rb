class Action 

  attr_reader :x, :y, :type, :result

  def initialize(x, y, type)
    @x = x
    @y = y
    @type = type
    @result = check_if_saved?(x, y)
  end

  def check_if_saved?(x, y)
    x2 = rand(4) + 1
    y2 = rand(2) + 1
    result = (x2 == x && y2 == y)? 'save' : 'goal'
  end

end
