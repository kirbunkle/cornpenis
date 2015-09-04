require 'globals'
require 'mapRoutines'

local sti = require "lib.sti"

local Character = require 'character'
local Item = require 'item'
local Controller = require 'controller'

local objectArray = nil
local controller = nil
local map = nil

function love.load()
  initGlobals()
  controller = Controller:new()
  -- init objects
  local pc = Character:new(4, 100, 100)
  objectArray = {}
  
  
  -- TODO: these should be referenced by name, not by number (move 'player' instead of move '1')
  
  objectArray[1] = pc -- first element; arrays are 1 based
  objectArray[2] = Character:new(2, 500, 400)
  objectArray[3] = Character:new(3, 300, 100)
  objectArray[4] = Item:new(1, 800, 800)
  
  
  map = sti.new("maps/test")
  map.x = 0
  map.y = 0
  initMapCollision(map)

  
end

function love.update(dt)
  controller:update(dt, objectArray, map)
  
  map:update(dt)
  
  for i, v in ipairs(objectArray) do
    v:update(dt)
    if v:isDestroyed() then
      table.remove(objectArray, i)
    end
  end
end

function love.draw()
  love.graphics.push()
  love.graphics.translate(map.x, map.y)
  map:setDrawRange(map.x, map.y, SCREEN.w, SCREEN.h)
  map:draw()
  for i, v in ipairs(objectArray) do
    v:draw()
  end
  love.graphics.pop()
  HUD:newHud()
end