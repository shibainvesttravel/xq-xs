{@type:filter|@guid:5debe380b5d54aefa4f527cd919e44d1}
setbarfreq("D");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:Leng4(60,"短均線");
input:Leng5(120,"中均線");
input:Leng6(240,"長均線");
input:period1(15,"天數");
input:percent1(0.005,"間距1");
input:percent2(0.05,"間距2");
input:percent3(0.5,"間距3");

settotalBar(period1*2);

variable: ma1(0), ma2(0), ma3(0),ma4(0), ma5(0), ma6(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);
ma4 = average(c,Leng4);
ma5=  average(c,Leng5);
ma6 = average(c,Leng6);

value1=ma3/ma4;


condition1 = trueall(ma3>ma3[1], period1);
condition2 = trueall(ma4>ma4[1], period1);
condition3 = trueall(value1>value1[1], period1);


if condition3 
then 
ret = 1;







