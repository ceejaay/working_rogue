require 'gosu'
require_relative 'map'
require_relative 'player'
require_relative 'world'

class GameWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super WIDTH, HEIGHT
    self.caption = "Rogue"
    @camera_x, @camera_y = 0
    @map = []
    lines = World.new.array
    #lines = File.readlines("media/map.txt").map {|line| line.chomp}
    width = lines[0].length
    height = lines.length
    height.times do |y|
      width.times do |x|
      @map << Map.new(x * 20, y * 20, lines[y][x]) if lines[y][x] != nil
      end
    end
    @player = Player.new(260, 180, @map)
  end

  def update
    #this is production code. Makes it easy to close the window.
    @camera_x = [[@player.x - WIDTH / 2, 0].max, 1280 - WIDTH ].min
    @camera_y = [[@player.y - HEIGHT / 2, 0].max, 960 - HEIGHT].min
    close if button_down?(Gosu::KbEscape)

  end

  def button_down(id)
    case id
       when Gosu::KbUp
         if @player.clear?(:up)
           @player.move(:up)
         end
       when Gosu::KbDown
         if @player.clear?(:down)
           @player.move(:down)
         end
       when Gosu::KbLeft
         if @player.clear?(:left)
           @player.move(:left)
         end
       when Gosu::KbRight
         if @player.clear?(:right)
           @player.move(:right)
         end
       when Gosu::GP_UP
         if @player.clear?(:up)
           @player.move(:up)
         end
       when Gosu::GP_DOWN
         if @player.clear?(:down)
           @player.move(:down)
         end
       when Gosu::GP_LEFT
         if @player.clear?(:left)
           @player.move(:left)
         end
       when Gosu::GP_RIGHT
         if @player.clear?(:right)
           @player.move(:right)
         end
    end
  end

  def draw
    Gosu::translate(-@camera_x, -@camera_y) do
      @map.each {|tile| tile.draw(@player.x, @player.y)}
      @player.draw
    end
  end
end

window = GameWindow.new
window.show
