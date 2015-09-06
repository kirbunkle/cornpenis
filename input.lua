local class = require 'lib.middleclass.middleclass'

local Input = class('Input')

function Input:initialize()
  self.up = 'w'
  self.upPressed = false
  self.down = 's'
  self.downPressed = false
  self.left = 'a'
  self.leftPressed = false
  self.right = 'd'
  self.rightPressed = false
  self.dash = 'lshift'
  self.dashPressed = false
  self.click = 'l'
  self.clickPressed = false
  self.clickX = 0
  self.clickY = 0
  self.mouseX = 0
  self.mouseY = 0
end

function Input:update(dt)
  self.upPressed = love.keyboard.isDown(self.up)
  self.downPressed = love.keyboard.isDown(self.down)
  self.leftPressed = love.keyboard.isDown(self.left)
  self.rightPressed = love.keyboard.isDown(self.right)
  self.dashPressed = love.keyboard.isDown(self.dash)
  self.clickPressed = love.mouse.isDown(self.click)
  self.mouseX, self.mouseY = love.mouse.getPosition()
  if self.clickPressed then
    self.clickX, self.clickY = love.mouse.getPosition()
  end
end

return Input