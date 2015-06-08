local class = require 'lib.middleclass.middleclass'

local GraphicsManager = class('GraphicsManager')

function GraphicsManager:initialize()
  self.storedImages = {}
end

function GraphicsManager:getImage(imagePath)
  if self.storedImages[imagePath] == nil then
    self.storedImages[imagePath] = love.graphics.newImage(imagePath)
  end
  
  return self.storedImages[imagePath]
end
    

return GraphicsManager