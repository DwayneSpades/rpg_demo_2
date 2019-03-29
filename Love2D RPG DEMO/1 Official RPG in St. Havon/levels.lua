require 'country_battles'
require 'locker_battles'
function load_map(dt)
if map==1 then
  loadmap('maps/facility/core-dump.lua')
  locker_encounter()
end
if map==2 then
  loadmap('maps/facility/core_1.lua')
  locker_encounter()
end
if map==4 then
  loadmap('maps/facility/core_2.lua')
  locker_encounter()
end
 if map==0 then
  loadmap('maps/chez-peter.lua')
  country_encounter()
end
 if map==3 then
  loadmap('maps/country/country.lua')
  country_encounter()
end
end