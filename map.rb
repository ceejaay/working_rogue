class Map
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
