
function loadmap(path)
  love.filesystem.load(path)()
end
local tile_W,tile_H,tileSetPath,Quad_info, tileString
function newMap(tile_W,tile_H,tileSetPath,Quad_info, tileString)
  Tile_W = tile_W
  Tile_H = tile_W
  Tileset = love.graphics.newImage(tileSetPath)
--we load our sprite images
  
  --now we are creating quads for the individual tiles
  --these set the width and height
  local tileset_W=Tileset:getWidth()
  local tileset_H=Tileset:getHeight()
  --created a table that stores our tile sprite sections
  Quads={}
  --defines the particular tile images we want
  --I can make all the sprites I want by inserting them here. currently they are in a file that is 218 by 64 each sprite is 32 by 32
 
  for i,info in ipairs(Quad_info) do
    --info[1]=x,info[2]=y
    Quads[info[1]] = love.graphics.newQuad(info[2],info[3], Tile_W,Tile_H,tileset_W,tileset_H)
    end
  

  --creates a table that is a map that represents how the tiles will be drawn
  --TileMap is equal to 3
    
  TileMap = {}

  --this line gets teh width of the map
  local width = #(tileString:match("[^\n]+"))
  --creats the x or the collumbs first for (x,y) cooridnates
  for x = 1,width,1 do TileMap[x] = {} end
  --creates (x,y) coordinates to start from
   x =1
   y = 1
  for row in tileString:gmatch("[^\n]+") do
     assert(#row == width, 'Map is not aligned: width of row ' .. tostring(x) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
     local y = 1
     for character in row:gmatch(".") do
       TileMap[y][x] = character
       y = y + 1
     end
     x=x+1
   end
 end

 function drawmap()
     --rowIndex simply counts the number of items/rows of data it has starting from one to 3 which is all the rows it has
for collumbNumber,collumn in ipairs(TileMap) do
for rowNumber,char in ipairs(collumn) do
     --x and y respresent the placement and spacing of each tile
     local x = (collumbNumber*32)-32
     local y = (rowNumber*32)-32
     love.graphics.draw(Tileset,Quads[char],x,y)
   end
 end
 end

 