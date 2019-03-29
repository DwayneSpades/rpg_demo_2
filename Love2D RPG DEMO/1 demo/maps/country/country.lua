      Quad_info = {
    {' ',-32,0},
    {'.',0,0},--1
    {'#',32,0},--2
    {'*',0,32},--3
    {'^',32,32},--4
    {'G',64,0},--5
    {'R',64,32},--6
    {'B',98,0},--7
    {'Y',98,32},--8
    {'D',-98,32}--8
  }
--Battles


      local tileString = [[
^##################D#####^
^ .         .         *  ^
^. *      .              ^
^              *         ^
^        .               ^
^  . .         D         ^
^           .            ^
^           .     D      ^
^                        ^
^                      * ^
^ *         * *          ^
^         *######*       ^
^            *           ^
^           *            ^
^   *****************    ^
^     GRBY               ^
^  *                   * ^
^                        ^
################D#########
]]

--gives the perametrs for the sprite w,h and what image to load
newMap(32,32,'/images/countryside.png',Quad_info,tileString)