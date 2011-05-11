class World < GameObject
  
  attr_reader :players, :current_player, :terrain
  
  def initialize
    @player = Player.new(KeyboardInput.new, Vector.new(100, 100))
    @water = Water.new
  end

  def update
    @water.update
    @player.update
    @water.vel = Vector.new(-Gosu::offset_x(@player.angle, 1), -Gosu::offset_y(@player.angle, 1))
    
    close_game if game_over?
  end
  
  def draw
    @water.draw
    @player.draw
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

  def game_over?
    false
  end

  def close_game
    window.close
    exit
  end
        
end
