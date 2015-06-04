local class = require 'lib.middleclass.middleclass'
local Input = require 'input'
local Action = require 'action'

local Controller = class('Controller')

function Controller:initialize()
  self.input = Input:new()

  self.playerControl = false
  self.actions = {}
  self.actions[1] = Action:new() --TODO need to add action text to be parsed

  self.vel = 300
  self.dashMultiplier = 2
end

function Controller:update(dt, objectArray)
  self.input:update(dt)

  if self.playerControll then
    -- if controlling is enabled, update objectArray[1] (player character)
    local xVel, yVel = self:getPlayerVel(dt)
    objectArray[1]:move(xVel, yVel)
  end

  local actionCount = #self.actions
  if actionCount > 0 then 
    for i = #self.actions, 1, -1 do 
      if self.actions[i].running then
        self.actions[i]:update(dt, objectArray)
      else
        table.remove(self.actions, i)
      end
    end
  else
    self.playerControll = true
  end
end

  function Controller:getPlayerVel(dt)
    local vel = self.vel
    local xVel = 0
    local yVel = 0
    if self.input.dashPressed then
      vel = vel * self.dashMultiplier
    end
    if self.input.upPressed then
      yVel = yVel + (dt * -vel)
    end 
    if self.input.downPressed then
      yVel = yVel + (dt * vel)
    end 
    if self.input.rightPressed then
      xVel = xVel + (dt * vel)
    end 
    if self.input.leftPressed then
      xVel = xVel + (dt * -vel)
    end   
    return xVel, yVel
  end

  return Controller