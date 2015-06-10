local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'

WORLD = nil
GRAPHICS = nil
SCREEN = {}

function initWorld()
  WORLD = bump.newWorld()
end

function initScreen()
  SCREEN.w, SCREEN.h = love.graphics.getDimensions()
  SCREEN.midW = SCREEN.w / 2
  SCREEN.midH = SCREEN.h / 2
end

function initGlobals()
  initWorld()
  GRAPHICS = GraphicsManager:new()
  initScreen()
end