local class = require 'lib.middleclass.middleclass'

local Tooltip = class('Tooltip')

function Tooltip:initialize()
  self.text = nil
end

function Tooltip:update(dt)
  self.text = nil
end

function Tooltip:setText(text)
  if text[1] then
    self.text = text
  else
    self.text = { text }
  end
end

function Tooltip:draw()
  if self.text then
    for i, v in ipairs(self.text) do
      love.graphics.print(v, INPUT.mouseX + 10, INPUT.mouseY + (15 * i))
    end
  end
end

return Tooltip