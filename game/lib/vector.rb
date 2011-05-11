class Vector
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x, @y = x.to_f, y.to_f
  end
  
  def normalize
    length = Math.sqrt((@x * @x) + (@y * @y))
    Vector.new((@x / length), (@y / length))
  end
  
  def +(other)
    Vector.new(@x + other.x, @y + other.y)    
  end

  def -(value)
    if value.is_a?(Vector)
      Vector.new(@x - value.x, @y - value.y)    
    else
      Vector.new(@x - value, @y - value)    
    end
  end
  
  def *(value)
    if value.is_a?(Vector)
      Vector.new(@x * value.x, @y * value.y)
    else
      Vector.new(@x * value, @y * value)
    end
  end
  
  def /(value)
    if value.is_a?(Vector)
      Vector.new(@x / value.x, @y / value.y)
    else
      Vector.new(@x / value, @y / value)
    end
  end

  def -@
    Vector.new(-@x, -@y)
  end
  
  def distance_from(other)
    Gosu::distance(@x, @y, other.x, other.y)
  end
  
end
