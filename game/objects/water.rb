class Water < GameObject
  
  attr_accessor :vel
  
  def initialize
    @water = Resources.image(window, "water0")
    @pos = Vector.new(0, 0)
    @vel = Vector.new(0, 0)
  end
  
  def update
    @pos += @vel * window.frame_change(100)
  end
  
  def draw
    cordinates do |x, y|
      @water.draw(x, y, 0)
    end
  end
  
  private
  
  def cordinates
    0.upto((window.width / 32)) do |x|
      x = (x * 32 + @pos.x)
      if x > window.width
        @pos.x = 0 if x > (window.width * 2 - 32)     
        x = x - window.width - 32
      elsif x < -32
        @pos.x = -32 if x < -window.width
        x = x + window.width + 32
      end      
      
      0.upto((window.height / 32)) do |y|
        y = (y * 32 + @pos.y)
        if y > window.height #- 32
          @pos.y = 0 if y > (window.height * 2 - 32)     
          y = y - window.height - 32
        elsif y < -32
          @pos.y = -32 if y < -window.height
          y = y + window.height + 32
        end
        
        yield x, y
      end
    end    
  end
  
  
end