{@type:filter|@guid:aad49f9e88f84cab8896b2c29d0f3214}
SetBarFreq("W");
input:Leng1(60,"幾周均線");

variable: ma1(0);

ma1 = average(c, Leng1);

condition1 = c > ma1;

if condition1 then
ret = 1;



