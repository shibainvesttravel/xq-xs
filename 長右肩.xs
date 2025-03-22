{@type:filter|@guid:52b83479aa4846aab1749745d051083e}
setbarfreq("W");

input:Leng1(60,"短均線");
input:Leng2(120,"中均線");
input:Leng3(240,"長均線");

SettotalBar(leng3);

variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);

Value1=barslast (ma1 cross under ma2);


if ma2> maxlist(ma1, ma3)*1.001
and value1>=10
then
ret = 1;

