{@type:filter|@guid:937aa4906d034565bc94b847a3821aac}
SetBarFreq("W");
input:Leng1(20,"幾日均線");

variable: ma1(0);

ma1 = average(c, Leng1);

condition1 = c > ma1;

if condition1 then
ret = 1;



