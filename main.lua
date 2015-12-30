require 'globals'
require 'mapRoutines'

function love.load(arg)
  initGlobals()
  CONTROLLER:loadScriptForMap()
end

function love.update(dt)
  INPUT:update(dt)
  TOOLTIP:update(dt)
  CONTROLLER:update(dt)
  OBJECT_MANAGER:update(dt)
  MAP_MANAGER:update(dt)
  HUD:update(dt)
end

function love.draw()
  love.graphics.push()
  love.graphics.translate(SCREEN.mapX, SCREEN.mapY)
  MAP_MANAGER:draw()
  OBJECT_MANAGER:draw()
  love.graphics.pop()
  
  HUD:draw()  
  TOOLTIP:draw()
end