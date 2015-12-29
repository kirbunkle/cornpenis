local class = require 'lib.middleclass.middleclass'
local Action = require 'action'

local ControlAction = class('ControlAction', Action)

function ControlAction:initialize(actionText)
  Action.initialize(self, actionText)
  
  self.vel = 300
  self.dashMultiplier = 2
end

function ControlAction:getPlayerVel(dt)
  local vel = self.vel
  local xVel = 0
  local yVel = 0
  if INPUT.dashDown then
    vel = vel * self.dashMultiplier
  end
  if INPUT.upDown then
    yVel = yVel + (dt * -vel)
  end 
  if INPUT.downDown then
    yVel = yVel + (dt * vel)
  end 
  if INPUT.rightDown then
    xVel = xVel + (dt * vel)
  end 
  if INPUT.leftDown then
    xVel = xVel + (dt * -vel)
  end   
  return xVel, yVel
end

function ControlAction:update(dt, object)
  if object == nil then
    self.running = false
  end
  if self.running then
    local xVel, yVel = self:getPlayerVel(dt)
    object:move(xVel, yVel)
    MAP_MANAGER:center(object)
  end
end

return ControlAction