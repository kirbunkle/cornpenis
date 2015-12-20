local class = require 'lib.middleclass.middleclass'
local Action = require 'action'

local MoveAction = class('MoveAction', Action)

function MoveAction:initialize(actionText)
  Action.initialize(self, actionText)
  self.xToMove = 50
  self.yToMove = 50
  self.xVel = 50
  self.yVel = 50
  
  self.xMoved = 0
  self.yMoved = 0
end

function MoveAction:update(dt, object)
  if object == nil then
    self.running = false
  end
  if self.running then
    local xVel = dt * self.xVel
    if (xVel + self.xMoved) > self.xToMove then
      xVel = self.xToMove - self.xMoved
    end
    local yVel = dt * self.yVel
    if (yVel + self.yMoved) > self.yToMove then
      yVel = self.yToMove - self.yMoved
    end

    object:move(xVel, yVel)

    self.xMoved = self.xMoved + xVel
    self.yMoved = self.yMoved + yVel
    if (self.xMoved >= self.xToMove) and (self.yMoved >= self.yToMove) then
      self.running = false
    end
  end
end

return MoveAction