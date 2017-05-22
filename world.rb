#world building class
#640 / 20 = 32
#480 / 20 = 24
WORLD_WIDTH = 96
WORLD_HEIGHT = 72
class World
  attr_reader :array
  def initialize
#height is the first array. The one that contains the other arrays. It's the Y axis
    @array = Array.new(WORLD_HEIGHT) {Array.new(WORLD_WIDTH) {[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "T", "^" ].sample}}
  end

  def populate
    @array.each do |line|
      line.each do |tile|
        tile = [ nil, nil, nil, nil, "T", "^"].sample
      end
    end
  end

end
