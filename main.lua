require 'globals'

local sti = require "lib.sti"

local Character = require 'character'
local Controller = require 'controller'

local objectArray = nil
local controller = nil
local map = nil

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
  
  map = sti.new("maps/untitled")
  
end

function love.update(dt)
  controller:update(dt, objectArray)
  
  map:update(dt)
  
  for i, v in ipairs(objectArray) do
    v:update(dt)
    if v:isDestroyed() then
      table.remove(objectArray, i)
    end
  end
end

function love.draw()
  
  map:draw()
  
  for i, v in ipairs(objectArray) do
    v:draw()
  end
end