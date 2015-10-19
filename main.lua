require 'globals'
require 'mapRoutines'

local sti = require "lib.sti"

local Character = require 'character'
local Item = require 'item'
local Controller = require 'controller'
--local Hud = require 'hud'

local objectArray = nil
local controller = nil
local map = nil
--local hud = nil
local lovetest = require "test/lovetest"

function love.load(arg)
  -- Check for the testing command line flags
  if lovetest.detect(arg) then
    -- Run the tests
    lovetest.run()
  end
end

function love.load()
  initGlobals()
  controller = Controller:new()
  -- init objects
  local pc = Character:new(5, 100, 100)
  objectArray = {}
  
  
  -- TODO: these should be referenced by name, not by number (move 'player' instead of move '1')
  
  objectArray[1] = pc -- first element; arrays are 1 based
  objectArray[2] = Character:new(2, 500, 400)
  objectArray[3] = Character:new(3, 300, 100)
  objectArray[4] = Item:new(1, 760, 800)
  
  
  map = sti.new("maps/test")
  initMapCollision(map)
  --hud = Hud:new()
end

function love.update(dt)
  INPUT:update(dt)
  TOOLTIP:update(dt)
  
  controller:update(dt, objectArray, map)
  
  map:update(dt)
  
  for i, v in ipairs(objectArray) do
    v:update(dt)
    if v:isDestroyed() then
      table.remove(objectArray, i)
    end
  end
  
  --hud:setCount(#objectArray)
end

function love.draw()
  love.graphics.push()
  love.graphics.translate(SCREEN.mapX, SCREEN.mapY)
  map:setDrawRange(SCREEN.mapX, SCREEN.mapY, SCREEN.w, SCREEN.h)
  map:draw()
  for i, v in ipairs(objectArray) do
    v:draw()
  end
  love.graphics.pop()
  --hud:draw()
  TOOLTIP:draw()
end