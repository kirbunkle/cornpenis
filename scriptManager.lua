local class = require 'lib.middleclass.middleclass'
local ActionFactory = require 'actionFactory'

local Character = require 'character'
local Item = require 'item'

local ScriptManager = class('ScriptManager')

function ScriptManager:initialize()
  self.actions = {}
  self.actionFactory = ActionFactory:new()
end

function ScriptManager:addAction(action)
  if self.actions[action.target] == nil then 
    self.actions[action.target] = {}
  end
  table.insert(self.actions[action.target], action)
end

function ScriptManager:loadScriptForMap(mapID, gameData)
  OBJECT_MANAGER:addObject(Character:new(5, 600, 600), 'player')
  OBJECT_MANAGER:addObject(Character:new(2, 500, 400), 'enemy1')
  OBJECT_MANAGER:addObject(Character:new(3, 300, 100), 'enemy2')
  OBJECT_MANAGER:addObject(Item:new(1, 760, 800), 'item1')
  OBJECT_MANAGER:addObject(Item:new(1, 740, 820), 'item2')
  OBJECT_MANAGER:addObject(Item:new(1, 740, 780), 'item3')

  
  self:addAction(self.actionFactory:make('control player'))
  self:addAction(self.actionFactory:make('move enemy1'))
  self:addAction(self.actionFactory:make('move enemy2'))
  self:addAction(self.actionFactory:make('move enemy2'))
    
  SOUND:playMusic(4)
end

function ScriptManager:update(dt)
  -- need to update actions for objects once they are completed if applicable
  for i, v in pairs(self.actions) do
    local object = OBJECT_MANAGER:getObjectById(i)
    v[1]:update(dt, object)
    if not v[1].running then
      table.remove(v, 1)
      if v[1] == nil then
        self.actions[i] = nil
      end
    end
  end
end

return ScriptManager