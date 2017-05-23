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
#this shifts all the tiles to their right place. If you don't do this everything is in the wrong place. Maybe
    @map.each do |tile|
      tile.x = tile.x - WIDTH / 2
      tile.y = tile.y - HEIGHT / 2
    end
    @player = Player.new(640, 480, @map)
    @text = Gosu::Font.new(15)
#maybe make this into a constant
    @map_width = 1280
    @map_height = 960
  end

  def update
    @camera_x = [[@player.x - WIDTH / 2, 0].max, @map_width - WIDTH ].min
    @camera_y = [[@player.y - HEIGHT / 2, 0].max, @map_height - HEIGHT].min
    puts "#{Gosu::GP_BUTTON_0}" if button_down?(Gosu::GP_BUTTON_0)#A < 277
    puts "#{Gosu::GP_BUTTON_1}" if button_down?(Gosu::GP_BUTTON_1)#B < 278
    puts "menu" if button_down?(Gosu::GP_BUTTON_2)#X < 279
    puts "#{Gosu::GP_BUTTON_3}" if button_down?(Gosu::GP_BUTTON_3)#Y < 280
    puts "#{Gosu::GP_BUTTON_4}" if button_down?(Gosu::GP_BUTTON_4)#Shoulder Left < 281
    puts "#{Gosu::GP_BUTTON_5}" if button_down?(Gosu::GP_BUTTON_5)#Shoulder Right < 282
    puts "#{Gosu::GP_BUTTON_6}" if button_down?(Gosu::GP_BUTTON_6)#select button < 283
    puts "#{Gosu::GP_BUTTON_7}" if button_down?(Gosu::GP_BUTTON_7)#start button < 284
    puts "bomb!" if button_down?(Gosu::GP_RIGHT) and button_down?(Gosu::GP_BUTTON_3)
    #this is production code. Makes it easy to close the window.
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
      @text.draw("X: #{@player.x} Y: #{@player.y}", @player.x - 60, @player.y - 15, 1)
    end
#we'll draw the message box outside the camera
      #@text.draw("Cam X: #{-@camera_x} Cam Y: #{@camera_y}", 200, 200, 1)

  end
end

window = GameWindow.new
window.show
