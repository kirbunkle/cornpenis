local class = require 'lib.middleclass.middleclass'
local anim8 = require 'lib.anim8.anim8'

require 'globals'

local Animation = class('Animation')

function Animation:initialize(id)
  local animdata = DB:getRowById('animations', id)
  local imgdata = DB:getRowById('images', animdata['image_id'])
  local imgpath = DB:getValueById('image_folders', imgdata['folder_id'], 'path')..imgdata['filename']
  
  self.w = animdata['width']
  self.h = animdata['height']
  
  local grid = anim8.newGrid(self.w, self.h, imgdata['width'], imgdata['height'])
  
  self.animation = anim8.newAnimation(grid(animdata['grid_cols'], animdata['grid_row']), animdata['framerate'])
  self.image = GRAPHICS:getImage(imgpath)
end

function Animation:update(dt)
  self.animation:update(dt)
end

function Animation:draw(x, y)
  self.animation:draw(self.image, x, y)
end

function Animation:getWH()
  return self.w, self.h
end

function Animation:reset()
  self.animation:gotoFrame(1)
end

return Animation