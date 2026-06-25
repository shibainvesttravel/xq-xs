{@type:filter|@guid:408a3c7dea534b6d97f1dde385acb195}
SetBarFreq("W");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:period1(3,"連續天數大於");
input:period2(9,"連續天數小於");
input:percent1(0.005,"間距1");
input:percent2(0.015,"間距2");

settotalBar(period1*2);

variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);

value1=ma1/ma2;
value2=ma2/ma3;
value3=maxlist(ma1, ma2)/ma3;
value4=absvalue(ma1-ma2);
value5=absvalue(ma2-ma3);
value6=countif(value3<value4, period1);


if trueall(value3>(1+percent2), period1) 
then 
ret = 1;


