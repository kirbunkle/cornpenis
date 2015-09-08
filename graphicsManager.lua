local class = require 'lib.middleclass.middleclass'

local GraphicsManager = class('GraphicsManager')

function GraphicsManager:initialize()
  self.storedImages = {}
end

function GraphicsManager:getImage(imageId)
  if self.storedImages[imageId] == nil then
    self.storedImages[imageId] = love.graphics.newImage(DB:getFilePath('images', imageId))
  end
  
  return self.storedImages[imageId]
end
    

return GraphicsManager