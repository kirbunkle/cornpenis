local class = require 'lib.middleclass.middleclass'
local sti = require "lib.sti"

local MapManager = class('MapManager')

function MapManager:initialize(id)
  self.map = sti.new("maps/demo1")
  initMapCollision(self.map)
end

function MapManager:update(dt)
  self.map:update(dt)
end

function MapManager:draw()
  self.map:setDrawRange(SCREEN.mapX, SCREEN.mapY, SCREEN.w, SCREEN.h)
  self.map:draw()
end

function MapManager:center(centerObject)
  local x, y, w, h = centerObject:getDimensions()
  local moveX = (SCREEN.midW - (w / 2)) - x
  local moveY = (SCREEN.midH - (h / 2)) - y
  
  SCREEN:moveMap(self.map, moveX, moveY)
end

-- TODO need to move map routines here

return MapManager