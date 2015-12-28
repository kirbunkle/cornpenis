local class = require 'lib.middleclass.middleclass'

require 'mapRoutines'

local Controller = class('Controller')

function Controller:initialize()
  SCRIPT_MANAGER:loadScriptForMap()
  self.menuPressed = false
end

function Controller:update(dt)
  -- TODO update to use love.mousepressed instead of this business
  local items, len = WORLD:queryPoint(INPUT.mouseX - SCREEN.mapX, INPUT.mouseY - SCREEN.mapY)
  
  for i = 1, len do
    if items[i].onHover then
      items[i]:onHover()
    end
  end
  
  if INPUT.clickPressed then
    for i = 1, len do
      if items[i].onClick then
        items[i]:onClick()
      end
    end
  end
  
  if INPUT.menuPressed then
    if not self.menuPressed then
      HUD:toggleMenu(MENU_ID_INVENTORY)
      self.menuPressed = true
    end
  else
    self.menuPressed = false
  end
  
  SCRIPT_MANAGER:update(dt)
  OBJECT_MANAGER:update(dt)
  MAP_MANAGER:update(dt)
  HUD:update(dt)
end

function Controller:draw()
  love.graphics.push()
  love.graphics.translate(SCREEN.mapX, SCREEN.mapY)
  MAP_MANAGER:draw()
  OBJECT_MANAGER:draw()
  love.graphics.pop()
  HUD:draw()
end

return Controller