{@type:filter|@guid:b0e1336b82fd45219097da4c10fc431b}
SetBarFreq("D");
input:Leng1(5,"日均線");
input:period1(5,"幾日");

variable: ma1(0);

settotalBar(period1);


ma1 = average(close, Leng1);

condition1 = trueall(c> ma1,period1);

if condition1 then
ret = 1;


