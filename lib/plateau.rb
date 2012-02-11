class Plateau

  attr_reader :x, :y

  def initialize x, y
    @x = (0..x)
    @y = (0..y)
  end

end
