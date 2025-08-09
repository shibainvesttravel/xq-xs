{@type:filter|@guid:303ca473279f440c8a8357ea6a379e97}
SetBarFreq("D");
input:Leng1(60,"幾日均線");

variable: ma1(0);

ma1 = average(c, Leng1);

condition1 = c > ma1;

if condition1 then
ret = 1;



