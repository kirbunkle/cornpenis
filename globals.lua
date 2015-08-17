local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'
local SoundManager = require 'soundManager'

WORLD = nil
GRAPHICS = nil
SOUND = nil
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
  SOUND = SoundManager:new()  
  initScreen()
end