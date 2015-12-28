local bump = require 'lib.bump.bump'
local GraphicsManager = require 'graphicsManager'
local SoundManager = require 'soundManager'
local Database = require 'database'
local Input = require 'input'
local Screen = require 'screen'
local Tooltip = require 'tooltip'

local GameData = require 'gameData'
local ScriptManager = require 'scriptManager'
local MapManager = require 'mapManager'
local ObjectManager = require 'objectManager'
local Hud = require 'hud'

-- global objects
WORLD = nil
GRAPHICS = nil
SOUND = nil
DB = nil
INPUT = nil
SCREEN = nil
TOOLTIP = nil

-- global but really for controller
GAME_DATA = nil
SCRIPT_MANAGER = nil
MAP_MANAGER = nil
OBJECT_MANAGER = nil
HUD = nil

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
  
  GAME_DATA = GameData:new()
  SCRIPT_MANAGER = ScriptManager:new()
  MAP_MANAGER = MapManager:new()
  OBJECT_MANAGER = ObjectManager:new()
  HUD = Hud:new()
end

function split(str, delim, maxNb)
    -- Eliminate bad cases...
    if string.find(str, delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0    -- No limit
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then break end
    end
    -- Handle the last field
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result
end