require 'globals'

local Character = require 'character'
local Controller = require 'controller'

local objectArray = nil
local controller = nil

function love.load()
  initGlobals()
  controller = Controller:new()
  -- init objects
  local pc = Character:new('graphics/grass.png', 100, 100)
  objectArray = {}
  
  -- TODO: these should be referenced by name, not by number (move 'player' instead of move '1')
  
  objectArray[1] = pc -- first element; arrays are 1 based
  objectArray[2] = Character:new('graphics/purple.jpg', 500, 400)
  objectArray[3] = Character:new('graphics/purple.jpg', 300, 100)
  
  for i = 4, 500 do
    objectArray[i] = Character:new('graphics/purple.jpg', ((i * 32) % 600) + 32, math.ceil((i * 32) / 600) + 32)
  end
end

function love.update(dt)
  controller:update(dt, objectArray)
  
  for i, v in ipairs(objectArray) do
    v:update(dt)
    if v:isDestroyed() then
      table.remove(objectArray, i)
    end
  end
end

function love.draw()
  for i, v in ipairs(objectArray) do
    v:draw()
  end
end