Menu = require 'gui'
Gamestate= require'gamestate'
require 'player_stats'
require 'ai'
--The battle system-----------------------------------------------------------------
 main_battle={}
 minus=1
 
 ability=300
 T_bludgen={}
 T_abil={}
 T_shell={}
 space=0
function main_battle:init()
num_of_T=0
T_bludgen={}
T_abil={}
T_shell={}
battle = Menu.new()
    battle:addItem{
            name = 'Bludgeon',
            action = function()
            if num_of_T <=2 then
             table.insert(T_bludgen,T_create())
             num_of_T=num_of_T+1
             space=space+30
           end
           
            end
    }
    battle:addItem{
            name = 'Defend',
            action = function()
               
            end
    }
    battle:addItem{
            name = 'Breaker Ability',
            action = function()
                   if num_of_T <=2 and breakerpower >0 then
             table.insert(T_abil,T_create())
             num_of_T=num_of_T+1
             space=space+30
             breakerpower=breakerpower-50
           end
            end
    }
    battle:addItem{
            name = 'Shell',
            action = function()
                   if num_of_T <=2 and shellstrength >0 then
             table.insert(T_shell,T_create())
             num_of_T=num_of_T+1
             space=space+30
             shellstrength=shellstrength-1
           end
            end
    }
   end
function main_battle:update(dt)
if experience>=30 then 
  doubt=200
end
if experience>=60 then 
  doubt=150
end
if experience>=90 then 
  doubt=100
end
if experience>=200 then 
  doubt=100
  end
battle:update(dt)
if health <=0 then
  love.event.push('quit')
end
if enemy_health <=0 then
  Gamestate.switch(main_win)
  breakerpower=breakerpower+spoils_breakerpower
  shellstrength=shellstrength+spoils_shellstrength
  experience=experience+spoils_xp
  T_abil={}
  T_bludgen={}
  T_shell={}
  num_of_T=0
  space=0
  T.y=290
end
enemy_cadence=enemy_cadence-enemy_speed*dt
if enemy_cadence<=0 then
  health=health-75
  enemy_cadence=enemy_doubt
  
end
for i,v in ipairs(T_abil)do
v.time_ability=v.time_ability-v.speed*dt
if v.time_ability<=0 then
  health=health+50
  table.remove(T_abil,i)
  space=space-30
  num_of_T=num_of_T-1
  
end
end
for i,v in ipairs(T_bludgen) do
v.time_bludgen=v.time_bludgen-v.speed*dt 
--Bludgen------------------------------------------------------
if v.time_bludgen<=0 then
  enemy_health=enemy_health-strength
  table.remove(T_bludgen,i)
  space=space-30
  num_of_T=num_of_T-1
end
end

for i,v in ipairs(T_shell) do
v.time_shell=v.time_shell-v.speed*dt
--Bludgen------------------------------------------------------
if v.time_shell<=0 then
  enemy_health=enemy_health-200
  table.remove(T_shell,i)
  space=space-30
  num_of_T=num_of_T-1
end
 
end
end
function main_battle:draw()
battle:draw(10,300)
love.graphics.setColor(255,255,255,255)
love.graphics.print('Enemy health'..enemy_health..'',300,10)
for i,v in ipairs(T_bludgen) do
love.graphics.setColor(255,255,255,255)
love.graphics.print('\nT- '.. v.time_bludgen..'',v.x,T.y + v.space)
end
for i,v in ipairs(T_abil) do
love.graphics.setColor(25,255,200,255)
love.graphics.print('\nT- '.. v.time_ability..'',v.x,T.y + v.space)
end
for i,v in ipairs(T_shell) do
love.graphics.setColor(255,150,20,255)
love.graphics.print('\nT- '.. v.time_shell..'',v.x,T.y + v.space)
end
love.graphics.setColor(255,255,255,255)
love.graphics.print('Health: '..health..'\nBP: '..breakerpower..'\nShell Strength: '..shellstrength..'\nbattle menuY:',10,10)
love.graphics.print('Enemy Attack in T- '..enemy_cadence..'',300,100)
end
function main_battle:keyreleased(key,code)
battle:keypressed(key)
end
function T_create()
T={}
T.time_bludgen=doubt
T.time_ability=300
T.time_shell=800
T.speed=minus
T.x=400
T.y=290
T.space=space
return T
end
space=0



--[[if v.time<=0 then
  enemy_health=enemy_health-200
  table.remove(T_num,i)
  space=space-30
  num_of_T=num_of_T-1
  end]]