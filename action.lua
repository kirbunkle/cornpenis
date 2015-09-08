local class = require 'lib.middleclass.middleclass'

local Action = class('Action')

function Action:initialize(actionText)
  -- TODO need to parse out the action text to get what this action will contain  
  self.xToMove = 50
  self.yToMove = 50
  self.xVel = 50
  self.yVel = 50
  
  self.xMoved = 0
  self.yMoved = 0
  
  self.target = tonumber(actionText)
  
  self.running = true
  self.wait = true -- wait until the action is finished before running another action
end

function Action:update(dt, objectArray)
  if self.running then
    local xVel = dt * self.xVel
    if (xVel + self.xMoved) > self.xToMove then
      xVel = self.xToMove - self.xMoved
    end
    local yVel = dt * self.yVel
    if (yVel + self.yMoved) > self.yToMove then
      yVel = self.yToMove - self.yMoved
    end

    objectArray[self.target]:move(xVel, yVel)

    self.xMoved = self.xMoved + xVel
    self.yMoved = self.yMoved + yVel
    if (self.xMoved >= self.xToMove) and (self.yMoved >= self.yToMove) then
      self.running = false
      SOUND:playMusic(3)
    end
  end
end

return Action