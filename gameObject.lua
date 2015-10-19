local class = require 'lib.middleclass.middleclass'

local GameObject = class('GameObject')

function GameObject:initialize(fx, fy)  
  assert(self.sprite, 'GameObject:initialize, sprite must be created before super initialize is called')
  self.w, self.h = self.sprite:getWH()
  self.x = fx
  self.y = fy
  self.offsetY = self.h - self.w
  if self.offsetY < 0 then self.offsetY = 0 end
  self.collideY = self.y + self.offsetY
  self.xVel = 0
  self.yVel = 0
  self.active = true -- flag to tell when to clean this thing up
  WORLD:add(self, self.x, self.collideY, self.w, self.w)
end

function GameObject:update(dt)
  if self.active then
    self.sprite:update(dt)
    self.xVel = 0
    self.yVel = 0
  end
end

function GameObject:draw()
  if self.active then
    self.sprite:draw(self.x, self.y)
  end
end

function GameObject:move(xVel, yVel)
  if self.active then
    self.xVel = xVel
    self.yVel = yVel
  
    local cols = 0
    local len = 0

    self.x, self.collideY, cols, len = WORLD:move(self, self.x + self.xVel, self.collideY + self.yVel)
    self.y = self.collideY - self.offsetY
  end
end

function GameObject:destroy()
  WORLD:remove(self)
  self.active = false
end

function GameObject:isDestroyed()
  return not self.active
end

function GameObject:getDimensions()
  return self.x, self.y, self.w, self.h
end

return GameObject

  

