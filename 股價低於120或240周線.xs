{@type:filter|@guid:4a827172f68e45afaf9f95bdb7c6e12d}
SetBarFreq("W");
input:Leng1(120,"幾周線");
input:Leng2(240,"幾周線");

variable: ma1(0), ma2(0);

settotalBar(30);

ma1 = average(c, Leng1);
ma2 = average(c, Leng2);

condition1=C<ma1;
condition2=C<ma2;


if condition1 or condition2 
then
ret = 1;


