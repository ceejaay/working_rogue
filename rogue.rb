require 'gosu'
require_relative 'map'
require_relative 'player'

class GameWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super WIDTH, HEIGHT
    self.caption = "Rogue"
    @map = []
    lines = File.readlines("media/map.txt").map {|line| line.chomp}
    width = lines[0].length
    height = lines.length
    height.times do |y|
      width.times do |x|
      @map << Map.new(x * 20, y * 20) if lines[y][x] == "."
      end
    end
    @player = Player.new(260, 180, @map)
  end

  def update
    #this is production code. Makes it easy to close the window.
    close if button_down?(Gosu::KbEscape)
  end

  def button_down(id)
    @player.move(:up) if id == (Gosu::KbUp) and @player.clear?(:up)
    @player.move(:down) if id == (Gosu::KbDown) and @player.clear?(:down)
    @player.move(:left) if id == (Gosu::KbLeft) and @player.clear?(:left)
    @player.move(:right) if id == (Gosu::KbRight) and @player.clear?(:right)
  end

  def draw
    @map.each do |tile, distance|
#this works in the opposite. Not sure how to figure the distance threshold.
      distance = Gosu.distance(@player.x, @player.y, tile.x, tile.y)
      if distance < 60
        tile.draw
      end
    end
    @player.draw
  end
end

window = GameWindow.new
window.show
