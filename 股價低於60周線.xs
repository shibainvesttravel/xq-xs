{@type:filter|@guid:8921ea4e512e4faeb7bef0be8a5db93c}
SetBarFreq("W");
input:Leng1(60,"幾周線");

variable: ma1(0);

settotalBar(30);

ma1 = average(c, Leng1);


condition1=C<ma1;



if condition1 
then
ret = 1;


