class GameObject
  
  attr_reader :window
  
  def world
    window.world
  end
  
  def window
    GameWindow.instance
  end
  
end
