Gamestate = require 'gamestate'
spoils_xp=0
spoils_shellstrength=1
spoils_breakerpower=200
local room={r1=0,r2=0}
--Encounter positions-------------
function country_battles()
fought={f1=0,f2=0,f3=0,f5=0,f6=0,f7=0,f8=0,f9=0,f0=0}
end

function country_encounter()
  enemy_health=400
  enemy_doubt=450
if player.x == 4 and player.y==3 then
  if fought.f1==0 then
  Gamestate.switch(main_event)
  fought.f1=1
end
end
if player.x == 16 and player.y==4 then
  if fought.f2==0 then
  Gamestate.switch(main_event)
  fought.f2=1
end
end
if player.x == 23 and player.y==2 then
  if fought.f3==0 then
  Gamestate.switch(main_event)
  fought.f3=1
  end
end
if player.x == 20 and player.y== 1 then
fought.f1=0
fought.f2=0
fought.f3=0
fought.f4=0
fought.f5=0
fought.f6=0
fought.f7=0
fought.f8=0
fought.f9=0
fought.f10=0
locker_room=1
 map=1
 player.x,player.y=17,18
end 
end
function country_draw()
  
end
