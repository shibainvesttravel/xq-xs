{@type:filter|@guid:39f52ab7c3524769b74b057d6cb6ddb0}

setbarfreq("D");
input:XLength(240,"長期大量計算期數");
input:Length1(150,"大於幾日");
input:Length2(240,"小於幾日");

settotalbar(XLength);


value1=FastHighestBar(volume,XLength);
value2=high[value1];

if value1<= length2 and value1>= length1 
and C>=value2*0.85
then
ret = 1;
