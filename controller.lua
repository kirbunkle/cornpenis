local class = require 'lib.middleclass.middleclass'
local Input = require 'input'
local Action = require 'action'

require 'mapRoutines'

local Controller = class('Controller')

function Controller:initialize()
  self.input = Input:new()

  self.playerControl = false
  self.actions = {}
  self.actions[1] = Action:new('1') --TODO need to add action text to be parsed
  self.actions[2] = Action:new('2')

  self.vel = 300
  self.dashMultiplier = 2
end

function Controller:update(dt, objectArray, map)
  self.input:update(dt)
  
  -- TODO update to use love.mousepressed instead of this business
  local items, len = WORLD:queryPoint(self.input.clickX - map.x, self.input.clickY - map.y)
  
  for i = 1, len do
    if items[i].onHover then
      items[i]:onHover()
    end
  end
  
  if self.input.clickPressed then
    for i = 1, len do
      if items[i].onClick then
        items[i]:onClick()
      end
    end
  end

  local actionCount = #self.actions
  if actionCount > 0 then 
    for i = actionCount, 1, -1 do 
      if self.actions[i].running then
        self.actions[i]:update(dt, objectArray)
      else
        table.remove(self.actions, i)
      end
    end
  else
    self.playerControll = true
  end
  
  if self.playerControll then
    -- if controlling is enabled, update objectArray[1] (player character)
    local xVel, yVel = self:getPlayerVel(dt)
    objectArray[1]:move(xVel, yVel)
    self:center(objectArray[1], map)
  end
end

function Controller:center(centerObject, map)
  local x, y, w, h = centerObject:getDimensions()
  local moveX = (SCREEN.midW - (w / 2)) - x
  local moveY = (SCREEN.midH - (h / 2)) - y
  
  moveMap(map, moveX, moveY)
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