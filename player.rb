class Player
  TOP = 0
  LEFT = 0
  BOTTOM = 940
  RIGHT = 1260
  attr_accessor :x, :y

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
        @y -= 20 unless @y == TOP
      when :down
        @y += 20 unless @y == BOTTOM
      when :left
        @x -= 20 unless @x == LEFT
      when :right
        @x += 20 unless @x == RIGHT
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
