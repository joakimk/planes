class Player < GameObject 
  
  attr_accessor :angle, :power, :pos, :vel, :hp, :input, :sprite
  
  def initialize(input, pos, sprite)
    @input, @pos, @sprite = input, pos, sprite
    @hp, @angle, @power = 100, 0, 500
    @vel = Vector.new(0, 0)
    @plane_sprite = Sprite.new(sprite, Vector.new(window.width / 2, window.height / 2), 10)
  end

  def update
    @angle -= window.frame_change(80) if @input.left?
    @angle += window.frame_change(80) if @input.right?

    @plane_sprite.update(@angle)
    @vel = Vector.new(-Gosu::offset_x(@angle, 1), -Gosu::offset_y(@angle, 1))
    @pos += @vel * window.frame_change(100)
    # world.trigger_event! :player_fired if @input.fire?
  end
  
  def draw
    @plane_sprite.draw
  end
    
end

