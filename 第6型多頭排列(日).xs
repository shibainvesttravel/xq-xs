{@type:filter|@guid:92ceb615cc0443519a1888099308e092}
SetBarFreq("D");
input:Leng1(5,"5均線");
input:Leng2(10,"10均線");
input:Leng3(20,"20均線");
input:Leng4(60,"60均線");
input:Leng5(120,"120均線");
input:Leng6(240,"240均線");
input:period1(1,"連續天數大於");
input:period2(20,"連續天數小於");
input:percent1(0.01,"間距1");
input:percent2(0.03,"間距2");

variable: ma1(0), ma2(0), ma3(0),ma4(0), ma5(0), ma6(0);

settotalBar(leng6);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);
ma4 = average(c,Leng4);
ma5 = average(c,Leng5);
ma6 = average(c,Leng6);

value1=maxlist(ma1, ma2, ma3)/minlist(ma1, ma2, ma3);
value2=maxlist(ma4, ma5, ma6)/minlist(ma4, ma5, ma6);
value3=minlist(ma1, ma2, ma3);
value4=maxlist(ma4, ma5, ma6);
value5=value3/value4;


if trueall(value3>value4, period2) 
and trueall(value1<(1+percent1), period1)
and trueall(value5>(1+percent2), period2)
then 
ret = 1;


