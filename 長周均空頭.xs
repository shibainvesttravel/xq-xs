{@type:filter|@guid:2383e932f88a4571b6c784b27bae421f}

setbarfreq("W");

input:Leng1(60,"短均線");
input:Leng2(120,"中均線");
input:Leng3(240,"長均線");

SettotalBar(Leng3);


variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);


if ma3>ma2 and ma2>ma1
then
ret = 1;

