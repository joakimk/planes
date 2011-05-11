require 'rubygems'
require 'gosu'
(Dir['game/lib/**/*rb'] + Dir['game/base/*rb'] + Dir['game/**/*rb']).uniq.each { |path| require(path) }

class GameWindow < Gosu::Window
  
  attr_reader :width, :height, :world, :render_fps
    
  def initialize
    @@instance = self
    @width = 640
    @height = 480

    super(width, height, false)
    self.caption = "Planes"

    @world = World.new
    @start_time = @last_frame_time = @last_fps_time = Gosu::milliseconds    
  end
    
  def update
    calc_frame_times
    @world.update        
  end
    
  def draw
    @world.draw
  end
  
  def button_down(id)
    if id == Gosu::Button::KbEscape
      close
    end
  end  
  
  def frame_change(amount)
    (amount / 25.0) * @ratio
  end
  
  def frame_ratio
    @ratio
  end
  
  def self.instance
    @@instance
  end  
  
  private
  
  def calc_frame_times
    current_time = Gosu::milliseconds
    frame_time = current_time - @last_frame_time
    @last_frame_time = current_time    
    @fps = (1000.0 / frame_time)   
    @ratio = (25 / @fps)
    
    if current_time - @last_fps_time > 500
      @last_fps_time = current_time
      @render_fps = @fps
    end
  end
  
end

window = GameWindow.new
window.show
