local class = require 'lib.middleclass.middleclass'

local GraphicsManager = class('GraphicsManager')

function GraphicsManager:initialize(db)
  self.storedImages = {}
  self.db = db
end

function GraphicsManager:getImage(imageId)
  if self.storedImages[imageId] == nil then
    local imgdata = self.db:getRowById('images', imageId)
    local imagePath = self.db:getValueById('folders', imgdata['folder_id'], 'path')..imgdata['filename']
  
    self.storedImages[imageId] = love.graphics.newImage(imagePath)
  end
  
  return self.storedImages[imageId]
end
    

return GraphicsManager