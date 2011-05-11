class Input
  
  def initialize
    @window = GameWindow.instance
  end
  
  protected
  
  def button_down?(button)
    @window.button_down?(button)
  end
  
end
