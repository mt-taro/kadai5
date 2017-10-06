# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'
require_relative 'block'
require_relative 'bullet'

Window.width  = 640
Window.height = 480

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

bullet_img = Image.load("bullet.png")
bullet_img.setColorKey([0, 0, 0])

start_img = Image.load("start.png")
start_img.setColorKey([0, 0, 0])

end_img = Image.load("end.png")
end_img.setColorKey([0, 0, 0])

player = Player.new(288, 448, player_img)
block = Block.new
enemies = []
bullets = []

count = 1
random = Random.new

st = 0
over = 0

Window.loop do
  if st == 0
    Window.loop do
      Window.draw(0, 0, start_img)
      if Input.keyPush?(K_SPACE)
        st = 1
        break
      end
      break if Input.keyPush?(K_ESCAPE)
    end
  end
  
  break if Input.keyPush?(K_ESCAPE)
  
  count -= 1
  if count == 0
    count = 110
    a = random.rand(0..2)
    enemies.push(block.generate(a))
    enemies.flatten!
  end
  
  if Input.keyPush?(K_Z)
    bullets = Bullet.new(player.x+8, player.y, bullet_img)
  end
  
  Sprite.update(enemies)
  Sprite.draw(enemies)
  Sprite.update(bullets)
  Sprite.draw(bullets)
  player.update
  player.draw

  # 当たり判定
  Sprite.check(enemies, enemies)
  Sprite.check(enemies, player)
  Sprite.check(bullets, enemies)
  
  if player.over() == 1
    Window.loop do
      Window.draw(0, 0, end_img)
      if Input.keyPush?(K_ESCAPE)
        over = 1
        break
      end
    end
  end
  break if over == 1

end
