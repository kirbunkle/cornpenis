local class = require 'lib.middleclass.middleclass'

local Shape = require 'shape'

local HudMenu = class('HudMenu')

function HudMenu:initialize()
  self.x = SCREEN.w - 130
  self.y = 30
  self.background = Shape:new('fill', self.x, self.y, 80, 30, 60, 80, 200, 100)
  self.hour = '0'
  self.min = '00'
  self.ampm = 'am'
end

function HudMenu:update(dt)
  self.background:update(dt)
  local time = math.floor(GAME_DATA:getGameTime())
  self.hour = ''..math.floor((time / 60))
  time = time % 60
  if time < 10 then
    self.min = '0'..time
  else
    self.min = ''..time
  end
end

function HudMenu:draw()
  self.background:draw()
  love.graphics.print(self.hour..":"..self.min..' '..self.ampm , self.x + 14, self.y + 8)
end

return HudMenu