local class = require 'lib.middleclass.middleclass'

local Shape = require 'shape'

local InventoryMenu = class('InventoryMenu')

function InventoryMenu:initialize()
  self.x = 50
  self.y = 50
  self.background = Shape:new('fill', self.x, self.y, 300, 400, 60, 80, 200, 180)
  self.items = nil
end

function InventoryMenu:update(dt)
  self.background:update(dt)
  self.items = GAME_DATA:getInventory()
end

function InventoryMenu:draw()
  self.background:draw()
  for i, v in ipairs(self.items) do
    love.graphics.print(v.name..' ('..v.type..')', self.x + 20, self.y + (i * 20))
  end
end

return InventoryMenu