class MiniMap < GameObject

  attr_accessor :player

  def initialize(pos, map_size, world_size, player)
    @pos, @map_size, @world_size = pos, map_size, world_size
    @player = player
    @plane_sprite = Sprite.new("blue_plane", Vector.new(50, 50), 10, true, 8, 8)
    @background = Sprite.new("water0", @pos + (@map_size / 2), 0, true, @map_size.x, @map_size.y)
  end

  def update
    @plane_sprite.update(@player.angle)
    @plane_sprite.pos = @pos - 16 + (@map_size / 2) +
                        (-@player.pos * (@map_size / @world_size / 2))
    @background.update
  end

  def draw
    @background.draw
    @plane_sprite.draw
  end

end

