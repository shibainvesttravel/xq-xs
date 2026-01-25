{@type:filter|@guid:1a3d418adb45499ca33a6a6cbe2a091b}
SetBarFreq("D");
input:Leng1(60,"幾日均線");

variable: ma1(0);

ma1 = average(c, Leng1);

condition1 = c > ma1;

if condition1 then
ret = 1;



