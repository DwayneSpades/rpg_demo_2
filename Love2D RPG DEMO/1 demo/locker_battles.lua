Gamestate = require 'gamestate'
spoils_xp=10
spoils_shellstrength=1
spoils_breakerpower=200
locker_room=1
--counter dump Encounter Positions--------------------------------------------------------------------------------------
function locker_battles()
fought={f1=0,f2=0,f3=0,f5=0,f6=0,f7=0,f8=0,f9=0,f10=0}
end
--Core_dump encounters
function locker_encounter()
  enemy_health=400
  enemy_doubt=450
  
  if locker_room==3 then
    enemy_doubt=250
    end
if player.x == 4 and player.y==3 and locker_room==1 then
  if fought.f1==0 then
  Gamestate.switch(main_event)
  fought.f1=1
end
end
if player.x == 16 and player.y==4 and locker_room==1 then
  if fought.f2==0 then
  Gamestate.switch(main_event)
  fought.f2=1
end
end
if player.x == 23 and player.y==2 and locker_room==1 then
  if fought.f3==0 then
  Gamestate.switch(main_event)
  fought.f3=1
  end
end
--door and pathways-----------------------------------------------------
--core_dump exits
if player.x == 17 and player.y== 19 and locker_room==1 then
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
 map=3
 player.x,player.y=20,2
end 

if player.x == 26 and player.y== 11 and locker_room==1 then
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
 locker_room=2
 map=2
 player.x,player.y=2,11
end 
--core 1 exits---------------------------------------------------------------------------
if player.x == 7 and player.y==11 and locker_room==2 then
  if fought.f1==0 then
  Gamestate.switch(main_event)
  fought.f1=1
end
end
if player.x == 12 and player.y==8 and locker_room==2 then
  if fought.f2==0 then
  Gamestate.switch(main_event)
  fought.f2=1
end
end
if player.x == 12 and player.y==3 and locker_room==2 then
  if fought.f3==0 then
  Gamestate.switch(main_event)
  fought.f3=1
end
end
if player.x == 12 and player.y==19 and locker_room==2 then
  if fought.f4==0 then
  Gamestate.switch(main_event)
  fought.f4=1
end
end
if player.x == 1 and player.y== 11 and locker_room==2 then
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
 player.x,player.y=25,11
end
if player.x == 12 and player.y== 1 and locker_room==2 then
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
 locker_room=3
 map=4
 player.x,player.y=13,8
end 
--core 2 dorrs and encounters-----------------------------------------------------------------------
if player.x == 23 and player.y==7 and locker_room==3 then
  if fought.f1==0 then
  Gamestate.switch(main_event)
  fought.f1=1
end
end
if player.x == 16 and player.y==3 and locker_room==3 then
  if fought.f2==0 then
  Gamestate.switch(main_event)
  fought.f2=2
end
end
if player.x == 13 and player.y==7 and locker_room==3 then
  if fought.f3==0 then
  Gamestate.switch(main_event)
  fought.f3=3
end
end
if player.x == 19 and player.y==4 and locker_room==3 then
  if fought.f4==0 then
  Gamestate.switch(main_event)
  fought.f4=4
end
end
if player.x == 4 and player.y==7 and locker_room==3 then
  if fought.f5==0 then
  Gamestate.switch(main_event)
  fought.f5=5
end
end
if player.x == 8 and player.y==3 and locker_room==3 then
  if fought.f6==0 then
  Gamestate.switch(main_event)
  fought.f6=6
end
end
if player.x == 13 and player.y== 9 and locker_room==3 then
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
 locker_room=2
 map=2
 player.x,player.y=12,2
end 

end
function locker_draw()
  
end