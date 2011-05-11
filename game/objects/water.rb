class Water < GameObject
  
  attr_accessor :vel
  
  def initialize(pos, size)
    @water = Resources.image(window, "water0")
    @scroll = Vector.new(0, 0)
    @pos = pos
    @vel = Vector.new(0, 0)
    @size = size
  end
  
  def update
    @scroll += @vel * window.frame_change(100)
  end
  
  def draw
    cordinates do |x, y|
      @water.draw(x, y, 0)
    end
  end
  
  private
  
  def cordinates
    0.upto((@size.x / 32)) do |x|
      x = (x * 32 + @scroll.x)
      if x > @size.x
        @scroll.x = 0 if x > (@size.x * 2 - 32)     
        x = x - @size.x - 32
      elsif x < -32
        @scroll.x = -32 if x < -@size.x
        x = x + @size.x + 32
      end      
      
      0.upto((@size.y / 32)) do |y|
        y = (y * 32 + @scroll.y)
        if y > @size.y #- 32
          @scroll.y = 0 if y > (@size.y * 2 - 32)     
          y = y - @size.y - 32
        elsif y < -32
          @scroll.y = -32 if y < -@size.y
          y = y + @size.y + 32
        end
        
        yield @pos.x + x, @pos.y + y
      end
    end    
  end
  
  
end
