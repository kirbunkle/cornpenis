--classes
local Drawable = require 'drawable'

--globals
local pc = nil

function love.load()
  pc = Drawable:new('graphics/purple.jpg', 100, 100, 0.3)
end

function love.update(dt)
  local xVel = 0
  local yVel = 0
  if love.keyboard.isDown('up') then
    yVel = yVel + (dt * -200)
  end 
  if love.keyboard.isDown('down') then
    yVel = yVel + (dt * 200)
  end 
  if love.keyboard.isDown('right') then
    xVel = xVel + (dt * 200)
  end 
  if love.keyboard.isDown('left') then
    xVel = xVel + (dt * -200)
  end 
  pc:move(xVel, yVel)
end

function love.draw()
  pc:draw()
end