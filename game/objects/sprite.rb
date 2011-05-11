class Sprite < GameObject
  
  def initialize(name, pos, fps, repeat = true)
    @pos, @fps, @repeat = pos, fps, repeat
    @pos.x -= 16
    @pos.y -= 16
    @parts = Resources.tile_image(window, name, 32, 32)
    @index = 0
  end
  
  def draw
    @index = 0 if @repeat && done?
    @parts[@index.to_i].draw_rot(@pos.x, @pos.y, 0, @angle) unless done?
  end
  
  def update(angle = 0)
    @angle = angle
    @index += window.frame_change(@fps) unless done?
  end
  
  def done?
    @index.to_i >= @parts.size
  end
  
end
