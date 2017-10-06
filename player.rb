# coding: utf-8

class Player < Sprite
  @over = nil
  def update
    self.x += Input.x*2
    self.y += Input.y*2
  end
  
  def hit(obj)
    @over = 1
  end
  
  def over
    return @over
  end
end