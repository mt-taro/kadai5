# coding: utf-8
require_relative 'enemy'
class Bullet < Sprite
  def update
    if self.y >= Window.height - self.image.height
      self.vanish
    else
      self.y -= 2
    end
  end

  # 他のオブジェクトに衝突された際に呼ばれるメソッド
  def shot(obj)
    if obj.kind_of?(Enemy)
      self.vanish
    end
  end
end