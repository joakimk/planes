class Resources

  @@fonts, @@images, @@tile_images = {}, {}, {}

  def self.font(window, size)
    @@fonts[size] ||= Gosu::Font.new(window, Gosu::default_font_name, size)
  end
  
  def self.tile_image(window, path, width, height)
    @@tile_images[path] ||= Gosu::Image.load_tiles(window, "data/#{path}.png", width, height, true)
  end
  
  def self.image(window, path)
    @@images[path] ||= Gosu::Image.new(window, "data/#{path}.png", true)
  end
  
end
