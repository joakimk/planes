class KeyboardInput < Input
  
  def left?
    button_down? Gosu::Button::KbLeft
  end
  
  def right?
    button_down? Gosu::Button::KbRight
  end
  
  def up?
    button_down? Gosu::Button::KbUp
  end
  
  def down?
    button_down? Gosu::Button::KbDown
  end
  
  def fire?
    button_down? Gosu::Button::KbSpace
  end  
  
end
