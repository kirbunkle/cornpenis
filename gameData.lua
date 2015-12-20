local class = require 'lib.middleclass.middleclass'

local GameData = class('GameData')

function GameData:initialize()
  -- load game from save?
  self.persistantObjects = {}
  self.gameTime = 0
  self.gameDate = 0
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

function GameData:addToInventory(item, id)
  -- id could be position in inventory maybe
  self.playerInventory[id] = item
end

function GameData:getGameTime()
  return self.gameTime
end

function GameData:getGameDate()
  return self.gameDate
end

function GameData:update(dt)
  --update game time and other things
end

return GameData