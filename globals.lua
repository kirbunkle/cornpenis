local Controller = require 'controller'

CONTROLLER = nil

function initGlobals()
  CONTROLLER = Controller:new()
end