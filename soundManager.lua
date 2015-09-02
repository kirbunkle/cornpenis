local class = require 'lib.middleclass.middleclass'

local SoundManager = class('SoundManager')

function SoundManager:initialize(db)
  self.storedSounds = {}
  self.db = db

end

function SoundManager:getSound(soundId)
  
end

function SoundManager:playSE(soundId)
  if self.storedSounds[soundId] == nil then
    local soundinfo = self.db:getRowById('sounds', soundId)
    local soundPath = self.db:getValueById('folders', soundinfo['folder_id'], 'path')..soundinfo['filename']
    local soundData = love.sound.newSoundData(soundPath)
    assert(soundData:getSize() < 1000000, 'SoundManager:playSE() attempt to store sound file that is too large ('..tostring(soundData:getSize()/1000)..' Kb)')
  	self.storedSounds[soundId] = love.audio.newSource(soundData)
  end
  
  return love.audio.play(self.storedSounds[soundId]:clone())
end

function SoundManager:playMusic(soundId)
  if self.storedSounds[soundId] == nil then
    local soundinfo = self.db:getRowById('sounds', soundId)
    local soundPath = self.db:getValueById('folders', soundinfo['folder_id'], 'path')..soundinfo['filename']
  	self.storedSounds[soundId] = love.audio.newSource(soundPath)
  end
  
  return love.audio.play(self.storedSounds[soundId])
end
    

return SoundManager