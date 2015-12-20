local class = require 'lib.middleclass.middleclass'

local ObjectManager = class('ObjectManager')

function ObjectManager:initialize()
  self.objectHash = {}
end

function ObjectManager:addObject(obj, id)
  self.objectHash[id] = obj
end

function ObjectManager:getObjectById(id)
  return self.objectHash[id]
end

function ObjectManager:update(dt)
  for i, v in pairs(self.objectHash) do
    v:update(dt)
    if v:isDestroyed() then
      self.objectHash[i] = nil
    end
  end
end

function ObjectManager:draw()
  for i, v in pairs(self.objectHash) do
    v:draw()
  end
end

return ObjectManager