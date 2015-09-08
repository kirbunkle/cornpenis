local class = require 'lib.middleclass.middleclass'
local CharacterSprite = require 'characterSprite'
local GameObject = require 'gameObject'

local Character = class('Character', GameObject)

function Character:initialize(spriteId, fx, fy)
  self.sprite = CharacterSprite:new(spriteId)
  
  self.curDir = DIR_DOWN
  self.curAct = ACT_STAND
  
  self.stepSoundToggle = false -- alternates between walking and not walking to play a sound when we switch
  
  GameObject.initialize(self, fx, fy)
end

function Character:update(dt)
  if self.active then
    if self.xVel < 0 then
      self.curDir = DIR_LEFT
    elseif self.xVel > 0 then
      self.curDir = DIR_RIGHT
    end
    if self.yVel < 0 then
      self.curDir = DIR_UP
    elseif self.yVel > 0 then
      self.curDir = DIR_DOWN
    end
    
    if (self.xVel == 0) and (self.yVel == 0) then
      self.curAct = ACT_STAND
      if self.stepSoundToggle then
        self.stepSoundToggle = false
      end
    else
      self.curAct = ACT_WALK
      if not self.stepSoundToggle then
        SOUND:playSE(2)
        self.stepSoundToggle = true
      end
    end

    self.sprite:switchAnimation(self.curDir + self.curAct)
    GameObject.update(self, dt)
  end
end

function Character:onClick()
  self:destroy()
end

return Character