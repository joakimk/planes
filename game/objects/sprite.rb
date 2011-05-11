class Sprite < GameObject
  
  attr_accessor :pos

  def initialize(name, pos, fps, repeat = true, width = 32, height = 32)
    @pos, @fps, @repeat = pos, fps, repeat
    @width = width
    @height = height
    @pos.x -= 16
    @pos.y -= 16
    @parts = Resources.tile_image(window, name, 32, 32)
    @index = 0
  end
  
  def draw
    @index = 0 if @repeat && done?
    @parts[@index.to_i].draw_rot(@pos.x, @pos.y, 0, @angle, 0.5, 0.5, @width / 32.0, @height / 32.0) unless done?
  end
  
  def update(angle = 0)
    @angle = angle
    @index += window.frame_change(@fps) unless done?
  end
  
  def done?
    @index.to_i >= @parts.size
  end
  
end
