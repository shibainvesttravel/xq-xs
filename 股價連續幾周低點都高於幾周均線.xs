{@type:filter|@guid:45d1ba4d4b7246d28d69b3567bc0ed23}
SetBarFreq("W");
input:period1(10,"計算時期");
input:Leng1(60,"均線");


settotalBar(period1+10);

variable: ma1(0);

ma1 = average(c,Leng1);


if trueall(L>ma1, period1)
 then 
ret=1;
