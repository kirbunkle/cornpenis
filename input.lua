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
end

function Input:update(dt)
  self.upPressed = love.keyboard.isDown(self.up)
  self.downPressed = love.keyboard.isDown(self.down)
  self.leftPressed = love.keyboard.isDown(self.left)
  self.rightPressed = love.keyboard.isDown(self.right)
  self.dashPressed = love.keyboard.isDown(self.dash)
end

return Input