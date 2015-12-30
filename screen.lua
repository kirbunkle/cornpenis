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
  local mapW = map.width * map.tilewidth
  local mapH = map.height * map.tileheight
  
  if self.w > mapW then
    x = self.midW - (mapW / 2)
  else
    local lowerX = self.w - mapW
    if x > 0 then 
      x = 0
    elseif x < lowerX then
      x = lowerX
    end
  end
  
  if self.h > mapH then
    y = self.midH - (mapH / 2)
  else
    local lowerY = self.h - mapH
    if y > 0 then
      y = 0
    elseif y < lowerY then
      y = lowerY
    end
  end
  
  self.mapX = x
  self.mapY = y
end

return Screen