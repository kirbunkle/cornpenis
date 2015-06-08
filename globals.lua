local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'

WORLD = nil
GRAPHICS = nil

function initWorld()
  WORLD = bump.newWorld()
end

function initGlobals()
  initWorld()
  GRAPHICS = GraphicsManager:new()
end