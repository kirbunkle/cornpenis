local json = require 'lib.json.json'
local class = require 'lib.middleclass.middleclass'

local Database = class('Database')

function Database:initialize()
  local size = 0
  self.rawdata, size = love.filesystem.read('data/gamedata.json')
  self.gamedata = json.parse(self.rawdata)
  
  -- reorganize the data so we can find tables and fields by name
  for i, v in ipairs(self.gamedata['objects']) do 
    self.gamedata['objects'][v['name']] = v
    
    -- cryptic af
    for j, w in ipairs(v['rows']) do 
      for k, x in ipairs(w) do 
        w[v['columns'][k]['name']] = x
      end
    end
    
  end
end

function Database:getRowById(table, id)
  return self.gamedata['objects'][table]['rows'][id]
end

function Database:getValueById(table, id, field)
  local row = self:getRowById(table, id)
  return row[field]
end

function Database:debug()
  --love.graphics.print(self.rawdata)
  love.graphics.print(self.gamedata['objects']['animations']['rows'][2]['name'])
end

return Database
