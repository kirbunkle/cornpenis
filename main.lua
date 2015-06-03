require 'globals'
local PC = require 'playerCharacter'

local pc = nil

function love.load()
  initGlobals()
  pc = PC:new('graphics/purple.jpg', 100, 100, 0.3)
end

function love.update(dt)
  CONTROLLER:update(dt)
  pc:update(dt)
end

function love.draw()
  pc:draw()
end