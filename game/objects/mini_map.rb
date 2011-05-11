class MiniMap < GameObject

  attr_accessor :players

  def initialize(pos, map_size, world_size, players)
    @pos, @map_size, @world_size = pos, map_size, world_size
    @players = players
    @plane_sprites = @players.map { |player| Sprite.new(player.sprite, Vector.new(50, 50), 10, true, 8, 8) }
    @background = Sprite.new("water0", @pos + (@map_size / 2), 0, true, @map_size.x, @map_size.y)
  end

  def update
    @players.each_with_index do |player, i|
      @plane_sprites[i].update(player.angle)
      @plane_sprites[i].pos = @pos - 16 + (@map_size / 2) +
                              (-player.pos * (@map_size / @world_size / 2))
    end
    @background.update
  end

  def draw
    @background.draw
    @plane_sprites.each { |s| s.draw }
  end

end

