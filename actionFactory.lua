local class = require 'lib.middleclass.middleclass'
local MoveAction = require 'actions.moveAction'
local ControlAction = require 'actions.controlAction'

local ActionFactory = class('ActionFactory')

function ActionFactory:initialize()
  -- probs nothin
end

function ActionFactory:make(actionText)
  -- parse action text and make an action
  local text = split(actionText, ' ')
  local action = nil
  if text[1] == 'move' then 
    action = MoveAction:new(text)
  elseif text[1] == 'control' then
    action = ControlAction:new(text)
  end
  return action
end

return ActionFactory