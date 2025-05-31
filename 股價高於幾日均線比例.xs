{@type:filter|@guid:74130258146f48c199aac2bb714412d0}
SetBarFreq("D");
input:Leng1(20,"幾日均線");
input:leng2(20,"計算時期");
input:percent(80,"幾趴");

settotalBar(leng2*2);

variable: ma1(0);


ma1 = average(c, Leng1);

value1=countif(C>=ma1, Leng2);

if value1>=leng2*0.01*percent then 
ret=1;
