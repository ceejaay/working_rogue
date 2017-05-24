#bombs

class Bomb
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y =y
    @icon = Gosu::Font.new(15)
    @color = Gosu::Color::RED
  end

  def draw
      @icon.draw("B", @x, @y, 1, 1, 1, @color)
  end
end
