class Fog
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @image = Gosu::Image.new("media/fog.png")
  end

  def draw
    @image.draw(@x, @y, 3)
  end

  def move
    @x = @player.x
    @y = @player.y
  end
end
