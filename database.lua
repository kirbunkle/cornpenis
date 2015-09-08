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
    local rowCount = #v['rows']

    -- cryptic af
    for j = rowCount, 1, -1 do 
      local w = v['rows'][j]
      v['rows'][j] = nil
      v['rows'][w[1]] = w -- assume the first field is the id
      
      for k, x in ipairs(w) do 
        w[v['columns'][k]['name']] = x
      end
    end
    
  end
end

function Database:getRowById(table, id)
  assert(self.gamedata['objects'][table], 'Database:getRowById, requested table '..table..' does not exist')
  assert(self.gamedata['objects'][table]['rows'][id], 'Database:getRowById, requested id '..tostring(id)..' for table '..table..' does not exist')
  return self.gamedata['objects'][table]['rows'][id]
end

function Database:getValueById(table, id, field)
  local row = self:getRowById(table, id)
  assert(row[field], 'Database:getValueById, requested field '..field..' does not exist for table '..table)
  return row[field]
end

function Database:getFilePath(table, id)
  --assumes table has folder_id and filename to build the proper path
  local tableData = self:getRowById(table, id)
  return self:getValueById('folders', tableData['folder_id'], 'path')..tableData['filename']
end

function Database:debug()
  --love.graphics.print(self.rawdata)
  love.graphics.print(self.gamedata['objects']['animations']['rows'][2]['name'])
end

return Database
