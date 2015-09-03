local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'
local SoundManager = require 'soundManager'
local Database = require 'database'
local Hud = require 'hud'

-- global objects
WORLD = nil
GRAPHICS = nil
SOUND = nil
DB = nil
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
  DB = Database:new()
  GRAPHICS = GraphicsManager:new(DB)
  SOUND = SoundManager:new(DB)
  HUD = Hud:new()
  initScreen()
end