# coding: utf-8
require_relative 'enemy'
class Block
  def generate(kind)
    block = []
    enemy_img = Image.load("enemy.png")
    enemy_img.setColorKey([0, 0, 0])
    random = Random.new

    if kind == 0
      r = random.rand(0..18)
      (r..r+1).each do |i|
        (0..1).each do |j|
          block << Enemy.new(i*32, j*32, enemy_img)
        end
      end

    elsif kind == 1
      r = random.rand(0..16)
      j = 0
      (r..r+3).each do |i|
        block << Enemy.new(i*32, j*32, enemy_img)
      end

    elsif kind == 2
      r = random.rand(0..19)
      j = 0
      (r..r+2).each do |i|
        block << Enemy.new(i*32, j*32, enemy_img)
      end
      block << Enemy.new((r+1)*32, (j-1)*32, enemy_img)
    end

    return block
  end
end