{@type:filter|@guid:3f64eb66e9f04e5a9369776d79932fe5}
setbarfreq("W");
input:XLength(240,"長期大量計算期數");
input:Length1(90,"大於幾周");
input:Length2(240,"小於幾周");


settotalbar(XLength);


value1=FastHighestBar(volume,XLength);
value2=c[value1-1];


if value1<= length2 and value1>= length1 
and C>value2*0.6
then
ret = 1;
