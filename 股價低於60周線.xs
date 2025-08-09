{@type:filter|@guid:49527404200042d0a62a301eaad05f25}
SetBarFreq("W");
input:Leng1(60,"幾周線");

variable: ma1(0);

settotalBar(30);

ma1 = average(c, Leng1);


condition1=C<ma1;



if condition1 
then
ret = 1;


