class World < GameObject
  
  attr_reader :players, :current_player, :terrain
  
  def initialize
    @player = Player.new(KeyboardInput.new, Vector.new(100, 100))
    @water = Water.new
    @width = 20
    @height = 20
  end

  def update
    @water.update
    @player.update
    @water.vel = @player.vel

    warp_player

#p    @player.pos.x
#p    @player.pos.y
    
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

  def warp_player
    if @player.pos.x > @width * 32
      @player.pos.x = -(@width * 32)
    elsif @player.pos.x < -(@width * 32)
      @player.pos.x = @width * 32
    end

    if @player.pos.y > @height * 32
      @player.pos.y = -(@height * 32)
    elsif @player.pos.y < -(@height * 32)
      @player.pos.y = @height * 32
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
