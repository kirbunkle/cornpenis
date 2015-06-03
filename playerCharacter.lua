require 'globals'

local class = require 'lib.middleclass.middleclass'

local PC = class('PC')

function PC:initialize(imagepath, fx, fy, fscale)
  self.image = love.graphics.newImage(imagepath)
  self.x = fx
  self.y = fy
  self.scale = fscale
  self.rotation = 0
  self.vel = 200
  self.dashMultiplier = 2
end

function PC:update(dt)
  local vel = self.vel
  if CONTROLLER.dashPressed then
    vel = vel * self.dashMultiplier
  end
  if CONTROLLER.upPressed then
    self.y = self.y + (dt * -vel)
  end 
  if CONTROLLER.downPressed then
    self.y = self.y + (dt * vel)
  end 
  if CONTROLLER.rightPressed then
    self.x = self.x + (dt * vel)
  end 
  if CONTROLLER.leftPressed then
    self.x = self.x + (dt * -vel)
  end 
end

--[[ not really used right now
function PC:move(xVel, yVel)
  self.x = self.x + xVel
  self.y = self.y + yVel
  self.rotation = self.rotation + xVel - yVel
end
]]

function PC:draw()
  love.graphics.draw(self.image, self.x, self.y, math.rad(self.rotation), self.scale)
end

return PC