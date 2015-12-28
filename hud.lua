local class = require 'lib.middleclass.middleclass'

local InventoryMenu = require 'inventoryMenu'
local Hud = class('Hud')

MENU_ID_INVENTORY = 'inventory'

function Hud:initialize()
  self.curDisplay = ''
  self.displays = {}
  self.displays[MENU_ID_INVENTORY] = InventoryMenu:new()
end

function Hud:switchToMenu(menuId)
  if menuId == MENU_ID_INVENTORY then 
    self.curDisplay = MENU_ID_INVENTORY
  else
    self.curDisplay = ''
  end
end

function Hud:toggleMenu(menuId)
  if self.curDisplay == menuId then
    self:switchToMenu('')
  else
    self:switchToMenu(menuId)
  end
end

function Hud:update(dt)
  if self.displays[self.curDisplay] ~= nil then
    self.displays[self.curDisplay]:update(dt)
  end
end

function Hud:draw()
  if self.displays[self.curDisplay] ~= nil then
    self.displays[self.curDisplay]:draw()
  end
end

return Hud