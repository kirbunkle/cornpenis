local class = require 'lib.middleclass.middleclass'

local SoundManager = class('SoundManager')

function SoundManager:initialize()
  self.storedSounds = {}
end

function SoundManager:getSound(soundId)
  
end

function SoundManager:playSE(soundId)
  if self.storedSounds[soundId] == nil then
    local soundData = love.sound.newSoundData(DB:getFilePath('sounds', soundId))
    assert(soundData:getSize() < 1000000, 'SoundManager:playSE() attempt to store sound file that is too large ('..tostring(soundData:getSize()/1000)..' Kb)')
  	self.storedSounds[soundId] = love.audio.newSource(soundData)
  end
  
  return love.audio.play(self.storedSounds[soundId]:clone())
end

function SoundManager:playMusic(soundId)
  if self.storedSounds[soundId] == nil then
  	self.storedSounds[soundId] = love.audio.newSource(DB:getFilePath('sounds', soundId))
    self.storedSounds[soundId]:setLooping(true)
  end

  return love.audio.play(self.storedSounds[soundId])
end
    

return SoundManager