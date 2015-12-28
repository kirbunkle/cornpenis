local class = require 'lib.middleclass.middleclass'

local Shape = class('Shape')

function Shape:initialize(mode, x, y, w, h, r, g, b, a, shapeType)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.mode = mode
  self.r = r
  self.g = g
  self.b = b
  self.a = a or 255
end

function Shape:update(dt)
  -- maybe nothing?
end

function Shape:draw()
  love.graphics.push('all')
  love.graphics.setColor(self.r, self.g, self.b, self.a)
  love.graphics.rectangle(self.mode, self.x, self.y, self.w, self.h)
  love.graphics.pop()
end



return Shape