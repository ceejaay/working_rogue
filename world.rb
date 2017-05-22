#world building class
#640 / 20 = 32
#480 / 20 = 24
class World
  attr_reader :array
  def initialize
    @array = Array.new(48) {Array.new(64) {[nil, nil, nil, nil, nil, nil, nil, nil, "T", "^" ].sample}}
  end

  def populate
    @array.each do |line|
      line.each do |tile|
        tile = [ nil, nil, nil, nil, "T", "^"].sample
      end
    end
  end

end
