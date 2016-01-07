return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.11.0",
  orientation = "orthogonal",
  width = 30,
  height = 30,
  tilewidth = 64,
  tileheight = 64,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "demo",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../graphics/demo_ground.png",
      imagewidth = 1028,
      imageheight = 1028,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "floor",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        70, 21, 21, 70, 52, 38, 19, 82, 23, 57, 25, 82, 7, 8, 9, 82, 82, 82, 82, 82, 39, 40, 40, 40, 56, 71, 72, 71, 9, 17,
        21, 70, 54, 21, 22, 49, 35, 82, 39, 40, 41, 82, 23, 57, 25, 82, 82, 82, 82, 82, 82, 82, 82, 82, 39, 56, 24, 24, 25, 17,
        21, 54, 70, 52, 38, 65, 3, 82, 82, 82, 82, 82, 39, 40, 41, 82, 1, 2, 2, 2, 2, 3, 82, 82, 82, 23, 24, 57, 25, 33,
        70, 52, 37, 38, 18, 18, 65, 2, 2, 3, 82, 82, 82, 82, 1, 2, 66, 18, 18, 49, 50, 65, 2, 3, 7, 72, 57, 73, 71, 8,
        37, 38, 49, 34, 34, 50, 66, 18, 65, 65, 3, 82, 82, 1, 66, 17, 18, 67, 49, 65, 66, 18, 18, 19, 39, 40, 56, 24, 57, 24,
        34, 34, 35, 82, 82, 17, 18, 51, 51, 65, 19, 82, 1, 66, 18, 18, 49, 34, 35, 34, 34, 50, 18, 19, 82, 82, 39, 56, 24, 55,
        82, 82, 7, 8, 9, 17, 50, 18, 51, 18, 19, 82, 17, 18, 49, 34, 35, 7, 8, 8, 9, 17, 18, 65, 3, 82, 82, 39, 56, 71,
        82, 82, 23, 73, 25, 33, 50, 50, 18, 49, 19, 82, 17, 67, 19, 7, 8, 72, 24, 24, 25, 17, 18, 51, 19, 82, 82, 82, 39, 56,
        82, 82, 39, 40, 41, 82, 33, 34, 34, 34, 35, 82, 17, 49, 35, 23, 24, 24, 73, 57, 25, 17, 49, 50, 19, 82, 82, 1, 3, 39,
        82, 1, 3, 82, 82, 82, 82, 82, 82, 82, 1, 2, 66, 19, 7, 72, 24, 57, 24, 55, 41, 17, 65, 66, 19, 82, 82, 17, 65, 2,
        82, 33, 35, 82, 82, 1, 2, 2, 2, 2, 66, 18, 18, 19, 23, 73, 24, 24, 55, 41, 1, 66, 18, 49, 35, 82, 1, 66, 18, 18,
        82, 82, 82, 82, 1, 66, 4, 5, 6, 18, 18, 18, 18, 19, 39, 40, 40, 40, 41, 1, 66, 18, 18, 19, 82, 82, 17, 49, 50, 4,
        2, 3, 82, 1, 66, 4, 69, 70, 68, 6, 18, 4, 5, 6, 2, 2, 2, 2, 2, 66, 4, 6, 49, 19, 82, 82, 17, 65, 66, 36,
        50, 19, 82, 17, 18, 20, 21, 21, 21, 22, 18, 20, 54, 22, 18, 18, 18, 18, 18, 18, 36, 38, 49, 35, 82, 82, 17, 18, 18, 18,
        33, 50, 3, 17, 4, 69, 21, 54, 21, 22, 18, 36, 37, 38, 18, 49, 49, 34, 34, 34, 34, 34, 35, 82, 82, 82, 33, 50, 18, 18,
        1, 66, 19, 17, 20, 21, 70, 21, 52, 38, 18, 18, 49, 49, 34, 34, 35, 82, 82, 82, 82, 82, 82, 1, 3, 82, 82, 33, 50, 67,
        66, 49, 35, 17, 20, 21, 21, 52, 38, 49, 49, 34, 34, 35, 7, 8, 9, 82, 82, 7, 8, 9, 82, 33, 35, 82, 82, 1, 66, 18,
        34, 35, 82, 17, 36, 37, 37, 38, 49, 34, 35, 1, 2, 3, 39, 56, 71, 9, 82, 39, 56, 25, 82, 82, 82, 82, 1, 66, 51, 18,
        82, 82, 82, 33, 34, 34, 34, 34, 35, 82, 1, 66, 18, 65, 3, 39, 40, 41, 7, 9, 39, 41, 1, 3, 82, 82, 17, 18, 18, 18,
        7, 8, 9, 82, 82, 82, 82, 82, 82, 82, 17, 49, 50, 67, 65, 2, 3, 7, 72, 71, 9, 82, 33, 35, 82, 82, 33, 50, 18, 4,
        23, 57, 71, 8, 9, 7, 8, 8, 9, 82, 17, 65, 66, 4, 5, 6, 19, 39, 56, 57, 25, 1, 2, 3, 82, 82, 1, 66, 4, 69,
        23, 24, 24, 24, 25, 23, 24, 57, 25, 82, 33, 34, 50, 20, 52, 38, 65, 3, 39, 40, 41, 17, 19, 35, 82, 1, 66, 4, 69, 21,
        39, 40, 56, 24, 25, 23, 57, 55, 41, 1, 3, 82, 17, 36, 38, 49, 34, 35, 82, 82, 82, 33, 35, 82, 1, 66, 4, 69, 69, 54,
        82, 7, 72, 24, 71, 72, 24, 71, 9, 33, 35, 82, 33, 34, 34, 35, 82, 82, 82, 1, 3, 82, 82, 1, 66, 18, 20, 54, 70, 52,
        7, 72, 24, 55, 56, 57, 24, 24, 25, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 33, 35, 82, 82, 17, 18, 18, 36, 37, 37, 38,
        72, 73, 55, 41, 39, 40, 56, 24, 71, 8, 9, 7, 8, 9, 82, 82, 82, 1, 2, 3, 1, 3, 82, 33, 34, 34, 34, 34, 50, 18,
        24, 24, 25, 1, 3, 82, 23, 55, 56, 24, 71, 72, 57, 25, 82, 1, 3, 33, 34, 35, 17, 65, 3, 82, 82, 82, 82, 82, 33, 34,
        55, 56, 25, 33, 35, 7, 72, 71, 72, 24, 73, 24, 24, 25, 82, 17, 65, 2, 2, 2, 66, 51, 19, 82, 82, 1, 2, 3, 82, 82,
        71, 72, 71, 8, 8, 72, 24, 73, 55, 40, 40, 40, 40, 41, 1, 66, 18, 18, 18, 18, 51, 18, 19, 82, 82, 33, 50, 19, 82, 82,
        55, 40, 56, 24, 24, 24, 24, 55, 41, 82, 82, 82, 82, 1, 66, 18, 18, 18, 18, 18, 18, 49, 35, 82, 1, 3, 33, 35, 82, 82
      }
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 30,
      height = 30,
      visible = true,
      opacity = 1,
      properties = {
        ["collidable"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 81, 81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0, 81, 0, 81, 81, 0, 0, 0, 0, 0, 0, 81,
        81, 81, 81, 81, 81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 81, 0, 81, 81, 81, 0, 0, 0, 0, 0, 81,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81, 0, 0, 0, 0, 0, 81,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81, 81, 81, 81, 81, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81,
        81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 81
      }
    }
  }
}
