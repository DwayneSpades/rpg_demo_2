Gamestate= require'gamestate'
main_event={}
--Cutscene type stuff----------------------------------------------------------------
function main_event:init()

end
function main_event:update(dt)
 
end
function main_event:draw()
  love.graphics.print('A wild shell apeared!!!',300,300)
end
function main_event:keyreleased(key,code)
   if key == 'return' then
     Gamestate.switch(main_battle)
     end
end