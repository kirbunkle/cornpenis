local class = require 'lib.middleclass.middleclass'

local GameData = class('GameData')

function GameData:initialize()
  -- load game from save?
  self.persistantObjects = {}
  self.gameTime = 6.5 * 60 -- 6:30 am
  self.gameDate = 1
  self.playerInventory = {}
end

function GameData:addPersistantObject(object, id)
  self.persistantObjects[id] = object
end

function GameData:removePersistantObject(id)
  self.persistantObjects[id] = nil
end

function GameData:getPersistantObject(id)
  return self.persistantObjects[id]
end

function GameData:swapItemsInInventory(idA, idB)
  local tmpItem = self.playerInventory[idA]
  self.playerInventory[idA] = self.playerInventory[idB]
  self.playerInventory[idB] = tmpItem
end

function GameData:addToInventory(item)
  -- id could be position in inventory maybe
  local id = 1
  while self.playerInventory[id] ~= nil do
    id = id + 1
  end
  -- what if inventory is full
  self.playerInventory[id] = item
end

function GameData:getGameTime()
  return self.gameTime
end

function GameData:getGameDate()
  return self.gameDate
end

function GameData:getInventory()
  return self.playerInventory
end

function GameData:update(dt)
  if CONTROLLER:playerHasControl() then
    self.gameTime = self.gameTime + dt
  end
end

return GameData