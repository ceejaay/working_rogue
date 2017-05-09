class Player
  CENTER_X = 10
  CENTER_Y = 10
  attr_accessor :x, :y, :go_north, :go_south, :go_east, :go_west

  def initialize(x, y, map)
    @image = Gosu::Font.new(20)
    @x = x
    @y = y
    @map = map
  end

  def draw
    @image.draw("@", @x, @y, 1)
  end

  def move(direction)
    case direction
      when :up
        @y -= 20
      when :down
        @y += 20
      when :left
        @x -= 20
      when :right
        @x += 20
    end
  end

  def clear?(direction)
    clear = true
    @map.each do |tile|
      case direction
        when :up
          if @x/20 == tile.x/20 and (@y - 20)/20 == tile.y/20
            clear = false
            end
        when :down
          if @x/20 == tile.x/20 and (@y + 20)/20 == tile.y/20
            clear = false
            end
        when :left
          if (@x - 20)/20 == tile.x/20 and @y/20 == tile.y/20
            clear = false
            end
        when :right
          if (@x + 20)/20 == tile.x/20 and @y/20 == tile.y/20
            clear = false
          end
      end
    end
    return clear
  end

end
