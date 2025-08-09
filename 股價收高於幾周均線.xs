{@type:filter|@guid:da9c66baaca044cc9c651df9efbe34e7}
SetBarFreq("W");
input:Leng1(20,"幾周均線");

variable: ma1(0);

ma1 = average(c, Leng1);

condition1 = c > ma1;

if condition1 then
ret = 1;



