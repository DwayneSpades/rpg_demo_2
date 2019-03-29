

function player_update(dt)
--player abilities and triggers
    print('prone')
  local x=player.x
  local y=player.y
  local speed=player.speed
  --makes it to where you don't walk at the speed of light but you can stay on the grid system for the map sprites
  walktime = walktime - (1*dt)
  if walktime < 0  then
    canwalk = true
  end
  
  --Player Movement controls
 if love.keyboard.isDown('up') and canwalk == true and walls(x,y-speed)then
  player.y=y-(speed)  
  canwalk = false
  walktime=walkmax
end
if love.keyboard.isDown('down') and canwalk == true and walls(x,y+speed)then
 player.y=y+(speed)
    canwalk = false
  walktime=walkmax
end
if love.keyboard.isDown('left') and canwalk == true and walls(x-speed,y)then
 player.x=x-(speed)
    canwalk = false
  walktime=walkmax
end
if love.keyboard.isDown('right') and canwalk == true and walls(x+speed,y)then
 player.x=x+(speed)
    canwalk = false
  walktime=walkmax
end
--interaction
if TileMap[player.x][player.y]=='D' then
  love.graphics.print('HEYO',player.x*32-32,player.y*32-32)
  end
--The 'RUN' ability
if love.keyboard.isDown('lshift') then
walkmax=0.1
else
walkmax=0.3
end

if time==200 then
  player.x=2
  player.y=2
  time=0
  end

end
  sign=0
function player_draw()
  --drawws player in realtion to level perameters
 local x=(player.x*32)-32
 local y=(player.y*32)-32
 love.graphics.draw(player.sprite,x,y)
 --interaction

if TileMap[player.x][player.y]=='D' then
  if love.keyboard.isDown('d') then
 sign = 1

end
end
if sign==1 then love.graphics.print('HEYO',50,50)
  end

end
--defines the types of tiles that can be walked on
--player boundaries
function walls(x,y)
   local X=x
   local Y=y
  return TileMap[X][Y]== ' ' or
  TileMap[X][Y]== ' ' or
  TileMap[X][Y]== '.' or
  TileMap[X][Y]== 'D' 
  end