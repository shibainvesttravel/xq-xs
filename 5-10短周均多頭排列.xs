{@type:filter|@guid:b60b9fe5e6d64382b9b86e0e1aac9b14}
setbarfreq("W");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:percent1(0.015,"間距1");


variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);

condition1 = ma1 > ma2*(1+percent1);
condition2 = ma2 > ma2[1];


if condition1 and condition2 
then 
ret = 1;








