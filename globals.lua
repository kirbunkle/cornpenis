local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'
local SoundManager = require 'soundManager'
local Database = require 'database'
local Input = require 'input'
local Screen = require 'screen'
local Tooltip = require 'tooltip'

-- global objects
WORLD = nil
GRAPHICS = nil
SOUND = nil
DB = nil
INPUT = nil
SCREEN = nil
TOOLTIP = nil

function initWorld()
  WORLD = bump.newWorld()
end

function initGlobals()
  initWorld()
  DB = Database:new()
  GRAPHICS = GraphicsManager:new()
  SOUND = SoundManager:new()
  INPUT = Input:new()
  SCREEN = Screen:new()
  TOOLTIP = Tooltip:new()
end