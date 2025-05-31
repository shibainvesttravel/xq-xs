{@type:filter|@guid:4286f52616bb4aaf9e16c8238e126177}
SetBarFreq("W");
input:Leng1(60,"幾日均線");
input:leng2(20,"計算時期");
input:percent(80,"幾趴");

settotalBar(leng2*2);

variable: ma1(0);


ma1 = average(c, Leng1);

value1=countif(C>=ma1, Leng2);

if value1>=leng2*0.01*percent then 
ret=1;
