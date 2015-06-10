require 'globals'

function moveMap(map, x, y)
  --TODO what do we do when the map is smaller than the screen?
  local lowerX = SCREEN.w - (map.width * map.tilewidth)  
  local lowerY = SCREEN.h - (map.height * map.tileheight)
  
  if x > 0 then 
    x = 0
  elseif x < lowerX then
    x = lowerX
  end
  if y > 0 then
    y = 0
  elseif y < lowerY then
    y = lowerY
  end
  
  map.x = x
  map.y = y
end

-- copied from sti collision setup to allow use with bump instead of love.physics
function initMapCollision(map)

	local function calculateObjectPosition(object, tile)
		local o = {
			shape	= object.shape,
			x		= object.x,
			y		= object.y,
			w		= object.width,
			h		= object.height,
			polygon	= object.polygon or object.polyline or object.ellipse or object.rectangle
		}
		local t		= tile or { x=0, y=0 }

		local userdata = {
			object = object,
			instance = t,
			tile = t.gid and map.tiles[t.gid]
		}

		if o.shape == "rectangle" then
			o.r = object.rotation or 0
			local cos = math.cos(math.rad(o.r))
			local sin = math.sin(math.rad(o.r))

			if object.gid then
				local tileset = map.tiles[object.gid].tileset
				local lid = object.gid - map.tilesets[tileset].firstgid
				local tile = {}

				-- This fixes a height issue
				o.y = o.y + map.tiles[object.gid].offset.y

				for _, t in ipairs(map.tilesets[tileset].tiles) do
					if t.id == lid then
						tile = t
						break
					end
				end

				if tile.objectGroup then
					for _, obj in ipairs(tile.objectGroup.objects) do
						-- Every object in the tile
						calculateObjectPosition(obj, object)
					end

					return
				else
					o.w = map.tiles[object.gid].width
					o.h = map.tiles[object.gid].height
				end
			end

			WORLD:add(o, o.x, o.y, o.w, o.h)
		elseif o.shape == "ellipse" then
			print("unable to use ellipse for map collision")
		elseif o.shape == "polygon" then
      print("unable to use polygon for map collision")
		elseif o.shape == "polyline" then
      print("unable to use polyline for map collision")
		end
	end

	for _, tileset in ipairs(map.tilesets) do
		for _, tile in ipairs(tileset.tiles) do
			local gid = tileset.firstgid + tile.id

			if tile.objectGroup then
				if map.tileInstances[gid] then
					for _, instance in ipairs(map.tileInstances[gid]) do
						for _, object in ipairs(tile.objectGroup.objects) do
							-- Every object in every instance of a tile
							calculateObjectPosition(object, instance)
						end
					end
				end
			elseif tile.properties and tile.properties.collidable == "true" and map.tileInstances[gid] then
				for _, instance in ipairs(map.tileInstances[gid]) do
					-- Every instance of a tile
					local object = {
						shape	= "rectangle",
						x		= 0,
						y		= 0,
						width	= tileset.tilewidth,
						height	= tileset.tileheight,
					}

					calculateObjectPosition(object, instance)
				end
			end
		end
	end

	for _, layer in ipairs(map.layers) do
		if layer.properties.collidable == "true" then
			-- Entire layer
			if layer.type == "tilelayer" then
				for y, tiles in ipairs(layer.data) do
					for x, tile in pairs(tiles) do
						local object = {
							shape	= "rectangle",
							x		= x * map.tilewidth  + tile.offset.x,
							y		= y * map.tileheight + tile.offset.y,
							width	= tile.width,
							height	= tile.height,
						}
						calculateObjectPosition(object)
					end
				end
			elseif layer.type == "objectgroup" then
				for _, object in ipairs(layer.objects) do
					calculateObjectPosition(object)
				end
			elseif layer.type == "imagelayer" then
				local object = {
					shape	= "rectangle",
					x		= layer.x or 0,
					y		= layer.y or 0,
					width	= layer.width,
					height	= layer.height,
				}
				calculateObjectPosition(object)
			end
		end

		if layer.type == "objectgroup" then
			for _, object in ipairs(layer.objects) do
				if object.properties.collidable == "true" then
					-- Individual objects
					calculateObjectPosition(object)
				end
			end
		end
	end

	return collision
end