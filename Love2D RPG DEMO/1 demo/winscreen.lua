Gamestate= require'gamestate'
main_win={}
--Cutscene type stuff----------------------------------------------------------------
xp=spoils_xp
ss=spoils_shellstrength
bp=spoils_breakerpower

function main_win:init()


end
function main_win:update(dt)

end
function main_win:draw()
  
  love.graphics.print('Recived: \n\nXP: '..xp..'\nBreaker Power: '..bp..'\nshellstrength:'..ss..'',300,300)
end
function main_win:keyreleased(key,code)
   if key == 'return' then
     Gamestate.switch(main_game)
     end
end