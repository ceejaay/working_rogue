class Map
  CENTER_X = 10
  CENTER_Y = 10
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)
  end

  def draw
    @tile.draw("#", @x, @y, 1)
  end
end
