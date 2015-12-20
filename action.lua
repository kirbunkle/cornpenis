local class = require 'lib.middleclass.middleclass'

local Action = class('Action')

function Action:initialize(actionText)
  -- TODO need to parse out the action text to get what this action will contain  
  self.target = actionText[2]
  
  self.running = true
  self.wait = false -- wait until the action is finished before running another action
end

return Action