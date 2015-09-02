local class = require 'lib.middleclass.middleclass'

local soundManager = class('soundManager')

function soundManager:initialize(db)
  self.storedSounds = {}
  self.db = db

end

function soundManager:play(soundId)
  if self.storedSounds[soundId] == nil then
  	local sounddata = self.db:getRowById('sounds', soundId)
    local soundPath = self.db:getValueById('folders', sounddata['folder_id'], 'path')..sounddata['filename']
    self.storedSounds[soundId] = love.audio.newSource(soundPath)
  end
  
  return love.audio.play(self.storedSounds[soundId])
end
    

return soundManager