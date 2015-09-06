local class = require 'lib.middleclass.middleclass'
local Sprite = require 'sprite'
local GameObject = require 'gameObject'

require 'globals'

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
  end
end

function Item:draw()
  if self.active then
    GameObject.draw(self)
    if self.hoverTimer > 0.5 then
      love.graphics.print(self.name, INPUT.mouseX, INPUT.mouseY + 20)
      love.graphics.print(self.type, INPUT.mouseX, INPUT.mouseY + 33)
    end
  end
end

function Item:onHover()
  self.hovering = true
end

return Item