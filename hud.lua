local class = require 'lib.middleclass.middleclass'

local InventoryMenu = require 'inventoryMenu'
local Shape = require 'shape'
local Hud = class('Hud')

MENU_ID_INVENTORY = 'inventory'

function Hud:initialize()
  self.curDisplay = ''
  self.displays = {}
  self.displays[MENU_ID_INVENTORY] = InventoryMenu:new()
  
  self.textBuffer = 50
  self.textPadding = self.textBuffer + 10
  self.textZoom = 2
  self.textBackground = Shape:new('fill', self.textBuffer, SCREEN.midH + self.textBuffer, SCREEN.w - (self.textBuffer * 2), SCREEN.midH - (self.textBuffer * 2), 50, 70, 80, 180) 
  self.text = nil
  
  self.textX = self.textPadding
  self.textY = SCREEN.midH + self.textPadding
  self.textW = (SCREEN.w - (self.textPadding * 2)) / self.textZoom
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

function Hud:displayText(text)
  if (text ~= nil) and (string.len(text) > 0) then
    self.text = text
  else
    self.text = nil
  end
end

function Hud:clearText()
  self.text = nil
end

function Hud:update(dt)
  if self.displays[self.curDisplay] ~= nil then
    self.displays[self.curDisplay]:update(dt)
  end
  if self.text then
    self.textBackground:update(dt)
  end
end

function Hud:draw()
  if self.displays[self.curDisplay] ~= nil then
    self.displays[self.curDisplay]:draw()
  end
  if self.text then
    self.textBackground:draw()
    love.graphics.printf(self.text, self.textX, self.textY, self.textW, nil, nil, self.textZoom)
  end
end

return Hud