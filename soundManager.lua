local class = require 'lib.middleclass.middleclass'

local soundManager = class('soundManager')

function soundManager:initialize()
  self.storedSounds = {}
  self.storedSounds[1] = 'sounds/splat.mp3'
  self.storedsounds[2] = 'sounds/bgm.mp3' 
end

function soundManager:getSound(soundPath)
  if self.storedSounds[soundPath] == nil then
    self.storedSounds[soundPath] = love.audio.newSound(soundPath)
  end
  
  return self.storedSounds[soundPath]
end
    

return soundManager