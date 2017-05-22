class Map
  attr_accessor :x, :y
  def initialize(x, y, type)
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)
    @type = type
  end

  def draw(player_x, player_y)
    #distance = Gosu.distance(@x, @y, player_x, player_y)
    #if distance < 60
      @tile.draw(@type, @x, @y, 1)
    #end
  end
end
