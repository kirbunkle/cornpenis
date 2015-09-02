local class = require 'lib.middleclass.middleclass'
local Animation = require 'animation'

local Sprite = class('Sprite')

function Sprite:initialize(animationIds)
  self.animations = {}
  local tmpAnims = {}
  self.w = -1
  self.h = -1
  
  for i, v in pairs(animationIds) do
    if tmpAnims[v] == nil then 
      tmpAnims[v] = Animation:new(v)
    end
    self.animations[i] = tmpAnims[v]
    if self.w == -1 then
      self.w, self.h = self.animations[i]:getWH()
    else
      local tmpW, tmpH = self.animations[i]:getWH()
      assert(self.w == tmpW, 'Sprite:initialize() not all animations have matching widths')
      assert(self.h == tmpH, 'Sprite:initialize() not all animations have matching heights') 
    end
  end
  
  self.curAnimation = self.animations[1]
end

function Sprite:switchAnimation(id)
  if self.curAnimation ~= self.animations[id] then
    self.curAnimation = self.animations[id]
    self.curAnimation:reset()
  end
end

function Sprite:update(dt)
  self.curAnimation:update(dt)
end

function Sprite:draw(x, y)
  self.curAnimation:draw(x, y)
end

function Sprite:getWH()
  return self.w, self.h
end

return Sprite