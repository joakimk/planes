class GamepadInput < Input
  
  def left?
    button_down? Gosu::Button::GpLeft
  end
  
  def right?
    button_down? Gosu::Button::GpRight
  end
  
  def up?
    button_down? Gosu::Button::GpUp
  end
  
  def down?
    button_down? Gosu::Button::GpDown
  end
  
  def fire?
    button_down? Gosu::Button::GpButton1
  end
  
end
