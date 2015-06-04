local class = require 'lib.middleclass.middleclass'

local PC = class('PC')

function PC:initialize(imagepath, fx, fy, fscale)
  self.image = love.graphics.newImage(imagepath)
  self.x = fx
  self.y = fy
  self.scale = fscale
  self.rotation = 0
  self.xVel = 0
  self.yVel = 0
end

function PC:update(dt)
  self.x = self.x + self.xVel
  self.y = self.y + self.yVel
  self.rotation = self.rotation + self.xVel - self.yVel
  
  -- reset for next update
  self.xVel = 0
  self.yVel = 0
end

function PC:draw()
  love.graphics.draw(self.image, self.x, self.y, math.rad(self.rotation), self.scale)
end

function PC:move(xVel, yVel)
  self.xVel = xVel
  self.yVel = yVel
end

return PC