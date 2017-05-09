class Map
  attr_accessor :x, :y
  def initialize(x, y, type)
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)
    @type = type
  end

  def draw
    @tile.draw(@type, @x, @y, 1)
  end
end
