local class = require 'lib.middleclass.middleclass'
local CharacterSprite = require 'characterSprite'

require 'globals'

local Character = class('Character')

function Character:initialize(spriteId, fx, fy)
  self.sprite = CharacterSprite:new(spriteId)
  
  self.w, self.h = self.sprite:getWH()
  
  self.x = fx
  self.y = fy
  
  self.xVel = 0
  self.yVel = 0
  
  self.curDir = DIR_DOWN
  self.curAct = ACT_STAND
  
  self.active = true -- flag to tell when to clean this thing up
  
  WORLD:add(self, fx, fy, self.w, self.h)
end

function Character:update(dt)
  if self.active then
    if self.xVel < 0 then
      self.curDir = DIR_LEFT
    elseif self.xVel > 0 then
      self.curDir = DIR_RIGHT
    end
    if self.yVel < 0 then
      self.curDir = DIR_UP
    elseif self.yVel > 0 then
      self.curDir = DIR_DOWN
    end
    
    if (self.xVel == 0) and (self.yVel == 0) then
      self.curAct = ACT_STAND
    else
      self.curAct = ACT_WALK
    end

    self.sprite:switchAnimation(self.curDir + self.curAct)
    self.sprite:update(dt)
    
    -- reset for next update
    self.xVel = 0
    self.yVel = 0
  end
end

function Character:draw()
  if self.active then
    self.sprite:draw(self.x, self.y)
  end
end

function Character:move(xVel, yVel)
  if self.active then
    self.xVel = xVel
    self.yVel = yVel
  
    local cols = 0
    local len = 0

    self.x, self.y, cols, len = WORLD:move(self, self.x + self.xVel, self.y + self.yVel)
  end
end

function Character:onClick()
  self:destroy()
end

function Character:destroy()
  WORLD:remove(self)
  self.active = false
end

function Character:isDestroyed()
  return not self.active
end

function Character:getDimensions()
  return self.x, self.y, self.w, self.h
end

return Character