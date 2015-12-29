local class = require 'lib.middleclass.middleclass'
local ActionFactory = require 'actionFactory'

local Character = require 'character'
local Item = require 'item'

local ScriptManager = class('ScriptManager')

function ScriptManager:initialize()  
  self.actions = {}
  self.actionFactory = ActionFactory:new()
  
  self.textArray = nil
  self.textBeingDisplayed = ''
  self.textTimer = 0
  self.textCounter = 0
  self.textMax = 0
  self.letterDelay = 0.03
end

function ScriptManager:addAction(action)
  if self.actions[action.target] == nil then 
    self.actions[action.target] = {}
  end
  table.insert(self.actions[action.target], action)
end

function ScriptManager:loadScriptForMap(mapID, gameData)
  OBJECT_MANAGER:addObject(Character:new(5, 600, 600), 'player')
  OBJECT_MANAGER:addObject(Character:new(4, 500, 400), 'enemy1')
  OBJECT_MANAGER:addObject(Character:new(4, 300, 100), 'enemy2')
  OBJECT_MANAGER:addObject(Item:new(1, 760, 800), 'item1')
  OBJECT_MANAGER:addObject(Item:new(1, 740, 820), 'item2')
  OBJECT_MANAGER:addObject(Item:new(1, 740, 780), 'item3')

  
  self:addAction(self.actionFactory:make('control player'))
  self:addAction(self.actionFactory:make('move enemy1'))
  self:addAction(self.actionFactory:make('move enemy2'))
  self:addAction(self.actionFactory:make('move enemy2'))
    
  SOUND:playMusic(4)
end

function ScriptManager:displayText(text)
  self.textArray = {}
  text:gsub('.', function(c) table.insert(self.textArray, c) end)
  
  self.textTimer = 0
  self.textCounter = 0
  self.textMax = table.getn(self.textArray)
  self.textBeingDisplayed = ''
end

function ScriptManager:update(dt)
  if self.textArray ~= nil then
    -- pause actions, display text
    if self.textCounter < self.textMax then
      self.textTimer = self.textTimer + dt
      
      if INPUT.anyPressed then
        -- skip to the end
        self.textTimer = self.letterDelay * self.textMax
      end
      
      while (self.textTimer > self.letterDelay) and (self.textCounter < self.textMax) do 
        self.textCounter = self.textCounter + 1
        self.textTimer = self.textTimer - self.letterDelay
        self.textBeingDisplayed = self.textBeingDisplayed..self.textArray[self.textCounter]
      end
    else
      if INPUT.anyPressed then
        -- exit text box
        self.textArray = nil
        self.textBeingDisplayed = ''
      end
    end
    HUD:displayText(self.textBeingDisplayed)
  else
    -- no text, just run actions
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
    
    if INPUT.menuPressed then
      HUD:toggleMenu(MENU_ID_INVENTORY)
    else
      -- check the interaction with world objects
      local items, len = WORLD:queryPoint(INPUT.mouseX - SCREEN.mapX, INPUT.mouseY - SCREEN.mapY)
  
      for i = 1, len do
        if items[i].onHover then
          items[i]:onHover()
        end
      end
  
      if INPUT.clickPressed then
        for i = 1, len do
          if items[i].onClick then
            items[i]:onClick()
          end
          if items[i].getChat and self.textArray == nil then
            self:displayText(items[i]:getChat())
          end
        end
      end
    end
    
  end
end

return ScriptManager