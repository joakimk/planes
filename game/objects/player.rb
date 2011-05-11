class Player < GameObject 
  
  attr_accessor :angle, :power, :pos, :hp, :input
  
  def initialize(input, pos)
    @input, @pos = input, pos
    @hp, @angle, @power = 100, 0, 500
    @plane_sprite = Sprite.new("blue_plane", Vector.new(window.width / 2, window.height / 2), 10)
  end

  def update
    @angle -= window.frame_change(80) if @input.left?
    @angle += window.frame_change(80) if @input.right?
    @plane_sprite.update(@angle)
    # world.trigger_event! :player_fired if @input.fire?
  end
  
  def draw
    @plane_sprite.draw
  end
    
end
