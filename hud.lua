local class = require 'lib.middleclass.middleclass'

local hud = class('hud')

function hud:initialize()
	self.hud = {}

end

function hud:newHud()
	if self.hud == nil then
	  love.graphics.setColor(158, 185, 126)
      love.graphics.rectangle("fill", 200, 200, 200, 400)
  end
end

return hud