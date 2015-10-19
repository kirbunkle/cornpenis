local class = require 'lib.middleclass.middleclass'
local Sprite = require 'sprite'

--global constants
DIR_DOWN = 1
DIR_UP = 2
DIR_RIGHT = 3
DIR_LEFT = 4

ACT_STAND = 0
ACT_WALK = 4

local CharacterSprite = class('CharacterSprite', Sprite)

function CharacterSprite:initialize(characterSpriteId)
  local data = DB:getRowById('character_sprites', characterSpriteId)
  local animationIds = {}
  
  animationIds[DIR_DOWN + ACT_STAND] = data['standing_down_animation_id']
  animationIds[DIR_UP + ACT_STAND] = data['standing_up_animation_id']
  animationIds[DIR_RIGHT + ACT_STAND] = data['standing_right_animation_id']
  animationIds[DIR_LEFT + ACT_STAND] = data['standing_left_animation_id']
  
  animationIds[DIR_DOWN + ACT_WALK] = data['walking_down_animation_id']
  animationIds[DIR_UP + ACT_WALK] = data['walking_up_animation_id']
  animationIds[DIR_RIGHT + ACT_WALK] = data['walking_right_animation_id']
  animationIds[DIR_LEFT + ACT_WALK] = data['walking_left_animation_id']
  
  self.collideW = data['collide_w']
  self.collideH = data['collide_h']
  
  Sprite.initialize(self, animationIds)
end

return CharacterSprite