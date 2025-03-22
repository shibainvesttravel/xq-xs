{@type:filter|@guid:d5b4b8660736467581d6632dd8a6b724}
setbarfreq("W");

input:Leng1(60,"短均線");
input:Leng2(120,"中均線");
input:Leng3(240,"長均線");

SettotalBar(Leng3);


variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);


if ma3>maxlist(ma2,ma1)*1.05
then
ret = 1;

