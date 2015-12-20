require 'globals'
require 'mapRoutines'

local Controller = require 'controller'

local controller = nil
--local lovetest = require "test/lovetest"

function love.load(arg)
  -- Check for the testing command line flags
  --if lovetest.detect(arg) then
    -- Run the tests
  --  lovetest.run()
  --end
  
  initGlobals()
  
  controller = Controller:new()
end

function love.update(dt)
  INPUT:update(dt)
  TOOLTIP:update(dt)
  controller:update(dt)
end

function love.draw()
  controller:draw()
  TOOLTIP:draw()
end