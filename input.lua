local class = require 'lib.middleclass.middleclass'

local Input = class('Input')

function Input:initialize()
  self.up = 'w'
  self.upDown = false
  self.upPressed = false
  self.upCheck = false

  self.down = 's'
  self.downDown = false
  self.downPressed = false
  self.downCheck = false
  
  self.left = 'a'
  self.leftDown = false
  self.leftPressed = false
  self.leftCheck = false
  
  self.right = 'd'
  self.rightDown = false
  self.rightPressed = false
  self.rightCheck = false
  
  self.dash = 'lshift'
  self.dashDown = false
  self.dashPressed = false
  self.dashCheck = false
  
  self.click = 'l'
  self.clickDown = false
  self.clickPressed = false
  self.clickCheck = false
  
  self.menu = 'escape'
  self.menuDown = false
  self.menuPressed = false
  self.menuCheck = false
  
  self.anyDown = false
  self.anyPressed = false
  self.anyCheck = false
  
  self.clickX = 0
  self.clickY = 0
  self.mouseX = 0
  self.mouseY = 0
end

function Input:update(dt)
  self.upDown = love.keyboard.isDown(self.up)
  self.upPressed = (not self.upCheck) and self.upDown
  self.upCheck = self.upDown
  
  self.downDown = love.keyboard.isDown(self.down)
  self.downPressed = (not self.downCheck) and self.downDown
  self.downCheck = self.downDown
  
  self.leftDown = love.keyboard.isDown(self.left)
  self.leftPressed = (not self.leftCheck) and self.leftDown
  self.leftCheck = self.leftDown
  
  self.rightDown = love.keyboard.isDown(self.right)
  self.rightPressed = (not self.rightCheck) and self.rightDown
  self.rightCheck = self.rightDown
  
  self.dashDown = love.keyboard.isDown(self.dash)
  self.dashPressed = (not self.dashCheck) and self.dashDown
  self.dashCheck = self.dashDown
  
  self.clickDown = love.mouse.isDown(self.click)
  self.clickPressed = (not self.clickCheck) and self.clickDown
  self.clickCheck = self.clickDown
  self.mouseX, self.mouseY = love.mouse.getPosition()
  if self.clickDown then
    self.clickX, self.clickY = love.mouse.getPosition()
  end
  
  self.menuDown = love.keyboard.isDown(self.menu)
  self.menuPressed = (not self.menuCheck) and self.menuDown
  self.menuCheck = self.menuDown
  
  self.anyDown = self.upDown or self.downDown or self.leftDown or self.rightDown or self.dashDown or self.clickDown or self.menuDown
  self.anyPressed = (not self.anyCheck) and self.anyDown
  self.anyCheck = self.anyDown
end

return Input