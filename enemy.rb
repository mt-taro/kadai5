# coding: utf-8
require_relative 'bullet'
class Enemy < Sprite
  def update
    if (self.y < Window.height - self.image.height) && (@flag == nil)
      self.y += 1
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    if obj.kind_of?(Enemy)
      @flag = 1
    end
    if obj.kind_of?(Bullet)
      self.vanish
    end
  end
end