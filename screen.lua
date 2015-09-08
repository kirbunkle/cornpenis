local class = require 'lib.middleclass.middleclass'

local Screen = class('Screen')

function Screen:initialize()
  self.w, self.h = love.graphics.getDimensions()
  self.midW = self.w / 2
  self.midH = self.h / 2
  self.mapX = 0
  self.mapY = 0
end

function Screen:moveMap(map, x, y)
  --TODO what do we do when the map is smaller than the screen?
  local lowerX = self.w - (map.width * map.tilewidth)  
  local lowerY = self.h - (map.height * map.tileheight)
  
  if x > 0 then 
    x = 0
  elseif x < lowerX then
    x = lowerX
  end
  if y > 0 then
    y = 0
  elseif y < lowerY then
    y = lowerY
  end
  
  self.mapX = x
  self.mapY = y
end

return Screen