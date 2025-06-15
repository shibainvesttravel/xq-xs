{@type:filter|@guid:b8b2dd6aba8347bab83b4aaa0ce9110e}
SetBarFreq("D");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:period1(3,"連續天數大於");
input:period2(9,"連續天數小於");
input:percent1(0.02,"間距1");
input:percent2(0.05,"間距2");

settotalBar(period2*2);

variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);

value1=ma1/ma2;
value2=ma1/ma3;
value3=countif(value1>=(1+percent1),period1);
value4=countIf(value2>=(1+percent2),period1);
value5=countif(value1>=(1+percent1),period2);
value6=countIf(value2>=(1+percent2),period2);
value7=truecount(value1>=(1+percent1),period2+2);
value8=truecount(value2>=(1+percent2),period2+2);



if  value3=period1 and value4=period1
    and value7<=period2 and value8<=period2

then 
ret = 1;