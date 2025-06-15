{@type:filter|@guid:eba2366ea91248618e858413bbe72169}
SetBarFreq("D");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:period1(5,"連續天數大於");
input:period2(12,"連續天數小於");
input:percent1(0.005,"間距1");
input:percent2(0.015,"間距2");

variable: ma1(0), ma2(0), ma3(0);

settotalBar(period1*2);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);

value1=ma1/ma2;
value2=ma2/ma3;
value3=absvalue(ma1-ma2);
value4=absvalue(ma2-ma3);
value5=countif(value3<value4, period1);


if trueall(value2>(1+percent2), period1) 
and not trueall(value2>(1+percent2), period2) 
and value1<=1
then 
ret = 1;


