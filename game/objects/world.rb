class World < GameObject
  
  attr_reader :players, :current_player, :terrain
  
  def initialize
    @width = 20
    @height = 20
    @players = [ Player.new(KeyboardInput.new, Vector.new(100, 100), "blue_plane") ]

    if @players.size == 1
      @maps = [ Water.new ]
    elsif @players.size == 2
      @maps = [ Water.new, Water.new ]
    else
      raise "Unsupported number of players: #{@players.size}"
    end

    @mini_map = MiniMap.new(Vector.new(window.width - 100, window.height - 100), Vector.new(100, 100), Vector.new(@width * 32, @height * 32), @players)
  end

  def update
    @maps.each { |m| m.update }
    @players.each { |p| p.update }
    @mini_map.update

    @players.each_with_index do |player, i|
      @maps[i].vel = player.vel
      warp_player(player)
    end

    close_game if game_over?
  end
  
  def draw
    @maps.each { |m| m.draw }
    @players.each { |p| p.draw }
    @mini_map.draw
  end
        
  # def trigger_event!(type)
  #   case(type)
  #   when :player_fired
  #     if long_enough_since_last_spawn? && !@projectile
  #       @projectile = Projectile.new(@current_player.pos, @current_player.angle, @current_player.power)
  #     end
  #   when :projectile_hit
  #     @explosion = Explosion.new(@projectile.pos)
  #     @projectile = nil
  #   when :explosion_complete
  #     @explosion = nil
  #     select_next_player
  #   end
  # end
  
  private
  
  def long_enough_since_last_spawn?
    if !@last_spawn_time || Gosu::milliseconds - @last_spawn_time > 250
      @last_spawn_time = Gosu::milliseconds
      true
    else
      false
    end  
  end

  def warp_player(player)
    if player.pos.x > @width * 32
      player.pos.x = -(@width * 32)
    elsif player.pos.x < -(@width * 32)
      player.pos.x = @width * 32
    end

    if player.pos.y > @height * 32
      player.pos.y = -(@height * 32)
    elsif player.pos.y < -(@height * 32)
      player.pos.y = @height * 32
    end
  end

  def game_over?
    false
  end

  def close_game
    window.close
    exit
  end
        
end
