{@type:filter|@guid:30258f57adfd43d2afac9fdf37ceaabf}
setbarfreq("D");

input:Leng1(60,"短均線");
input:Leng2(120,"中均線");
input:Leng3(240,"長均線");

SettotalBar(Leng3);


variable: ma1(0), ma2(0), ma3(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);



if ma2> maxlist(ma1, ma3)*1.03
then
ret = 1;

