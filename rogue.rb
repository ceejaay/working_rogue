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

    @map = []
    puts @map
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
      distance = Gosu.distance(@player.x, @player.y, tile.x, tile.y)
      if distance < 60
        tile.draw
      end
    end
    @player.draw
    #@map.each {|tile| tile.draw}
  end
end

window = GameWindow.new
window.show
