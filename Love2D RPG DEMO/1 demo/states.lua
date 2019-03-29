Gamestate = require 'gamestate'
Menu = require 'gui'
require 'country_battles'
require 'locker_battles'
require 'levels'
require 't-minus'
require 'cutscenes'
require 'winscreen'
require 'player_stats'
--player setup
 canwalk=true
  walkmax=0.3 
  walktime=walkmax
love.keyboard.setKeyRepeat(true )
 player={
    x=2,
    y=2,
    speed=1,
    sprite=love.graphics.newImage('tile0.png')
   }
--player stats

--map selection number ----------------------------------------------
  map = 1
----------------------
local start_screen= {}
local start_menu= {}
local start_levels={}
local main_stats={}

main_game={}
main_pause={}

 Pause=false

function state_initiate()
Gamestate.registerEvents()
Gamestate.switch(start_screen)  
end

--start screen stuff---------------------------------------------------------------
function start_screen:init()
titlescreen = Menu.new()
    titlescreen:addItem{
            name = 'RPG in St. Havon',
            action = function()
                    Gamestate.switch(start_menu)
            end
    }
end
function start_screen:update(dt)
  titlescreen:update(dt)
end
function start_screen:draw()
  titlescreen:draw(300-love.graphics.getWidth()/4,300)
end
function start_screen:keyreleased(key,code)
  titlescreen:keypressed(key)  
end

--start Menu stuff---------------------------------------------------------------
function start_menu:init()
mainscreen = Menu.new()
    mainscreen:addItem{
            name = 'Start Game',
            action = function()
                    player.x,player.y=2,2
                    Gamestate.switch(main_game)
            end
    }
    mainscreen:addItem{
            name = 'options',
            action = function()
                    Gamestate.switch(start_levels)
            end
    }
    mainscreen:addItem{
            name = 'Quit Game',
            action = function()
                    love.event.push('quit')
            end
    }
end
function start_menu:update(dt)
  mainscreen:update(dt)
end
function start_menu:draw()
  mainscreen:draw(10,10)
end
function start_menu:keyreleased(key,code)
  mainscreen:keypressed(key)  
end
--Level select Stuff----------------------------------------------------------------
function start_levels:init()
levelselect = Menu.new()
    levelselect:addItem{
            name = 'Locker Room',
            action = function()
                    map=1
                    player.x,player.y=2,2
                    Gamestate.switch(main_game)
            end
    }
    levelselect:addItem{
            name = 'Dining Hall',
            action = function()
                    map=0
                    player.x,player.y=2,2
                    Gamestate.switch(main_game)
            end
    }
     levelselect:addItem{
            name = 'Country Side',
            action = function()
                    map=3
                    player.x,player.y=2,2
                    Gamestate.switch(main_game)
            end
    }
end
function start_levels:update(dt)
levelselect:update(dt)
end
function start_levels:draw()
levelselect:draw(10,10)
end
function start_levels:keypressed(key,code)
levelselect:keypressed(key)
end


--main game-------------------------------------------------------------------------
function main_game:init()
--switch for levels
country_battles()


end

function main_game:update(dt)
load_map(dt)
Pause=false
player_update(dt)
end
--tilemap

--main game draw function
function main_game:draw()
  
  if Pause==true then
   love.graphics.setColor(255,255,255,50) 
  else
    love.graphics.setColor(255,255,255,255)
  end
  drawmap()
  player_draw()
  love.graphics.print('X: '..player.x..'Y: '..player.y..'',10,10)
end
function main_game:keyreleased(key,code)
    if key == 'rshift' then
    Pause = true
    Gamestate.switch(main_pause) 
  end
    if key == 's' then
    
    Pause = true
    Gamestate.switch(main_stats) 
    end
end

--game stats stuff------------------------------------------------------------------
function main_stats:init()

    
end

function main_stats:update(dt)
if enemy_health <=0 then
  Gamestate.switch(main_win)
  breakerpower=breakerpower+spoils_breakerpower
  shellstrength=shellstrength+spoils_shellstrength
  T_abil={}
  T_bludgen={}
  T_shell={}
  num_of_T=0
  end
end
function main_stats:draw()
main_game:draw()
love.graphics.setColor(255,255,255,255)
love.graphics.print('Health: '..health..'\nStrength: '..strength..'\nDoubt: '..doubt..'\nConfidence: '..confidence..'\nBP: '..breakerpower..'\nShell Strength: '..shellstrength..'\nXP: '..experience..'',10,10)
love.graphics.print('(doubt) refers to how fast (you) the player can process the ability to commit actions\n towards or against another entity. You may find your heart will sway in the winds of indecision when faced with adversity...',10,130)
end
function main_stats:keyreleased(key,code)
  if key == 's' or key== 'return' then
  Gamestate.switch(main_game)
end
end
--pause menu stuff---------------------------------------------------------------
function main_pause:init()
pausescreen = Menu.new()
    pausescreen:addItem{
            name = 'Resume',
            action = function()
                    Pause = false
                    Gamestate.switch(main_game)
            end
    }
    pausescreen:addItem{
            name = 'Back to main menu',
            action = function()
                    Gamestate.switch(start_menu)
            end
    }
    pausescreen:addItem{
            name = 'Lvl Stats',
            action = function()
                    Gamestate.switch(main_stats)
            end
    }
end
function main_pause:update(dt)
pausescreen:update(dt)
end
function main_pause:draw()



main_game:draw()

love.graphics.print('Paused',280,300)
pausescreen:draw(10,10)

end
function main_pause:keyreleased(key,code)
  pausescreen:keypressed(key)
  if key == 'rshift' then
  Pause = false
  Gamestate.switch(main_game)
  end
end