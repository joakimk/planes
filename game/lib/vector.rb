class Vector
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x, @y = x, y
  end
  
  def normalize
    length = Math.sqrt((@x * @x) + (@y * @y))
    Vector.new((@x / length), (@y / length))
  end
  
  def +(other)
    Vector.new(@x + other.x, @y + other.y)    
  end
  
  def *(value)
    Vector.new(@x * value, @y * value)
  end
  
  def distance_from(other)
    Gosu::distance(@x, @y, other.x, other.y)
  end
  
end