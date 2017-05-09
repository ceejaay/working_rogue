require 'gosu'
require_relative 'map'
require_relative 'player'

class GameWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480

  def initialize
    super WIDTH, HEIGHT
    self.caption = "Rogue"
    #@text = Gosu::Font.new(20)
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
    close if button_down?(Gosu::KbEscape)
  end

  def button_down(id)
    @player.move(:up) if id == (Gosu::KbUp) and @player.clear?(:up)
    @player.move(:down) if id == (Gosu::KbDown) and @player.clear?(:down)
    @player.move(:left) if id == (Gosu::KbLeft) and @player.clear?(:left)
    @player.move(:right) if id == (Gosu::KbRight) and @player.clear?(:right)
  end

  def draw
    #@text.draw("x: #{@player.x} y: #{@player.y}", 100, 300, 1)
    @map.each {|tile| tile.draw}
    @player.draw
  end
end

window = GameWindow.new
window.show
