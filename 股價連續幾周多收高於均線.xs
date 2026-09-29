{@type:filter|@guid:8a0b90d3baee4d9fa0ce71b17ee5d56f}
SetBarFreq("W");
input:Leng1(20,"幾周均線");
input:leng2(10,"計算時期");
input:percent1(10,"離均線幾趴");
input:percent2(70,"幾趴高於均線");

settotalBar(leng2);

variable: ma1(0);

ma1 = average(c, Leng1);
value1=countif(c>ma1*(1+percent1*0.01), leng2);

if value1>=leng2*percent2*0.01
 then 
ret=1;
