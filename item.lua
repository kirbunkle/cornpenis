local class = require 'lib.middleclass.middleclass'
local Sprite = require 'sprite'
local GameObject = require 'gameObject'

local Item = class('Item', GameObject)

function Item:initialize(id, fx, fy)
  local itemData = DB:getRowById('items', id)
  self.name = itemData['name']
  self.type = itemData['type']
  self.hoverTimer = 0
  self.hovering = false
  self.sprite = Sprite:new({ itemData['animation_id'] })
  
  GameObject.initialize(self, fx, fy)
end

function Item:update(dt)
  if self.active then
    if self.hovering then
      self.hoverTimer = self.hoverTimer + dt
      self.hovering = false
    else
      self.hoverTimer = 0
    end
    if self.hoverTimer > 0.5 then
      TOOLTIP:setText({ self.name, self.type })
    end
  end
end

function Item:draw()
  if self.active then
    GameObject.draw(self)
  end
end

function Item:onHover()
  self.hovering = true
end

function Item:onClick()
  local itemdata = {}
  -- need to create a class for this, and to differentiate between this and the collidable item
  itemdata.name = self.name
  itemdata.type = self.type
  GAME_DATA:addToInventory(itemdata)
  self:destroy()
end

return Item