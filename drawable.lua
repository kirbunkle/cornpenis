local class = require 'lib.middleclass.middleclass'

local Drawable = class('Drawable')

function Drawable:initialize(imagepath, fx, fy, fscale)
  self.image = love.graphics.newImage(imagepath)
  self.x = fx
  self.y = fy
  self.scale = fscale
  self.rotation = 0
end

function Drawable:move(xVel, yVel)
  self.x = self.x + xVel
  self.y = self.y + yVel
  self.rotation = self.rotation + xVel - yVel
end

function Drawable:draw()
  love.graphics.draw(self.image, self.x, self.y, math.rad(self.rotation), self.scale)
end

return Drawable