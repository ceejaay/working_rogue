class Map
  attr_accessor :x, :y
  def initialize(x, y, type)
    @x = x
    @y = y
    @tile = Gosu::Font.new(20)
    @type = type
  end

  def draw(player_x, player_y)
    distance = Gosu.distance(@x, @y, player_x, player_y)
    if distance < 60
      case @type
        when "T"
          @tile.draw(@type, @x, @y, 1, 1, 1, Gosu::Color::GREEN)
        when "^"
          @tile.draw(@type, @x, @y, 1, 1, 1, Gosu::Color::GRAY)
        when "O"
          @tile.draw(@type, @x, @y, 1, 1, 1, Gosu::Color::BLUE)
      end
    end
  end
end
