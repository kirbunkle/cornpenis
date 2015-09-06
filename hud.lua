local class = require 'lib.middleclass.middleclass'

local hud = class('hud')

function hud:initialize()
	--self.hud = {}

end

function hud:draw()
	--if self.hud == nil then
	love.graphics.setColor(40, 50, 227)
    love.graphics.rectangle("fill", 100, 100, 400, 100)
    love.graphics.setColor(255,255,255)
    love.graphics.print (table.getn(main:objectArray),110,110)

  --end
end

return hud