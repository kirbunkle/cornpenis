require 'globals'

local PC = require 'playerCharacter'
local Controller = require 'controller'

local objectArray = nil
local controller = nil

function love.load()
  controller = Controller:new()
  -- init objects
  local pc = PC:new('graphics/purple.jpg', 100, 100, 0.3)
  objectArray = {}
  objectArray[1] = pc -- first element; arrays are 1 based
end

function love.update(dt)
  controller:update(dt, objectArray)
  
  for i, v in ipairs(objectArray) do
    v:update(dt)
  end
end

function love.draw()
  for i, v in ipairs(objectArray) do
    v:draw()
  end
end