{@type:filter|@guid:c0ef963717534bdd85cbc933ea44ad6a}
SetBarFreq("D");
input:Leng1(20,"幾日均線");
input:Leng2(60,"幾日均線");

variable: ma1(0), ma2(0);

ma1 = average(c, Leng1);
ma2 = average(c, Leng2);

condition1 = c > ma1;
condition2 = C < ma1 and close >ma2 and ma1>ma2;

if condition1 
or condition2
then
ret = 1;



