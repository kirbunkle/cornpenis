local class = require 'lib.middleclass.middleclass'

local hud = class('hud')

function hud:initialize()
	--self.hud = {}

end

function hud:setCount(n)

self.count = n

end

mid = love.graphics.newImage("/graphics/1mid.png")
right = love.graphics.newImage("/graphics/1right.png")
left = love.graphics.newImage("/graphics/1left.png")
mid2 = love.graphics.newImage("/graphics/2mid.png")
right2 = love.graphics.newImage("/graphics/2right.png")
left2 = love.graphics.newImage("/graphics/2left.png")
mid3 = love.graphics.newImage("/graphics/3mid.png")
right3 = love.graphics.newImage("/graphics/3right.png")
left3 = love.graphics.newImage("/graphics/3left.png")

function hud:draw()
	--if self.hud == nil then
	love.graphics.setColor(40, 50, 227)
    love.graphics.rectangle("fill", 100, 100, 400, 100)
    love.graphics.setColor(255,255,255)
    love.graphics.print (self.count,110,110)

    if (self.count == 4) and INPUT.rightPressed then
    
        love.graphics.draw(right,140,110)
    elseif 
    	(self.count == 3) and INPUT.rightPressed then
    
        love.graphics.draw(right2,140,110)
    elseif 
    	(self.count <= 2) and INPUT.rightPressed then
    
        love.graphics.draw(right3,140,110)
    elseif 
    	(self.count == 4) and INPUT.leftPressed then

    	love.graphics.draw(left,140,110)
    elseif 
    	(self.count == 3) and INPUT.leftPressed then
    
        love.graphics.draw(left2,140,110)
    elseif 
    	(self.count <= 2) and INPUT.leftPressed then
    
        love.graphics.draw(left3,140,110)
    elseif
    	self.count == 4 then
    	love.graphics.draw(mid,140,110)
    elseif
    	self.count == 3 then
    	love.graphics.draw(mid2,140,110)
     elseif
    	self.count <= 4 then
    	love.graphics.draw(mid3,140,110)
    end

  --end
end

return hud