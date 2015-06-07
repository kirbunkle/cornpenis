local bump = require 'lib.bump.bump'

WORLD = nil

function initWorld()
  WORLD = bump.newWorld()
end

function initGlobals()
  initWorld()
end