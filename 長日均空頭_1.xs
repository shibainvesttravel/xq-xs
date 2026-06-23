{@type:filter|@guid:a699d46d09b740e182a64c90acfb2735}
setbarfreq("D");

input:Leng1(60,"短均線");
input:Leng2(120,"中均線");
input:Leng3(240,"長均線");
input:percent3(0.03,"幾%");
input:percent4(0.05,"幾%");

SettotalBar(Leng3);


variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);


condition1=ma3 >=maxlist(ma1, ma2)*(1+percent3);
condition2=ma3 >=maxlist(ma1, ma2) and ma3 >=minlist(ma1, ma2)*(1+percent4);

if 
condition1 or condition2
then
ret = 1;

