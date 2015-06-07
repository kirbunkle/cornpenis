local class = require 'lib.middleclass.middleclass'
local anim8 = require 'lib.anim8.anim8'
require 'globals'

local Character = class('Character')

function Character:initialize(imagepath, fx, fy)
  local grid = anim8.newGrid(32, 32, 512, 512)
  
  self.walkingAnimation = anim8.newAnimation(grid('1-8', 1), 0.1)
  self.standingAnimation = anim8.newAnimation(grid('1-8', 1), 0.3)
  self.currentAnimation = self.standingAnimation
  self.image = love.graphics.newImage(imagepath)
  self.x = fx
  self.y = fy
  
  self.xVel = 0
  self.yVel = 0
  
  self.active = true -- flag to tell when to clean this thing up
  
  WORLD:add(self, fx, fy, 32, 32)
end

function Character:update(dt)
  if self.active then
    if (self.xVel == 0) and (self.yVel == 0) then
      if (self.currentAnimation ~= self.standingAnimation) then
        self.currentAnimation = self.standingAnimation
        self.currentAnimation:gotoFrame(1)
      end
    elseif (self.currentAnimation ~= self.walkingAnimation) then 
      self.currentAnimation = self.walkingAnimation
      self.currentAnimation:gotoFrame(1)
    end

    self.currentAnimation:update(dt)

    local cols = 0
    local len = 0

    self.x, self.y, cols, len = WORLD:move(self, self.x + self.xVel, self.y + self.yVel)

    -- reset for next update
    self.xVel = 0
    self.yVel = 0
  end
end

function Character:draw()
  if self.active then
    self.currentAnimation:draw(self.image, self.x, self.y)
  end
end

function Character:move(xVel, yVel)
  self.xVel = xVel
  self.yVel = yVel
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

return Character