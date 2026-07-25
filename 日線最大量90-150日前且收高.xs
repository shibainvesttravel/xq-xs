{@type:filter|@guid:71b664053eb74d6bafdf08fbe0a04622}
setbarfreq("D");
input:XLength(240,"長期大量計算期數");
input:Length1(90,"大於幾日");
input:Length2(150,"小於幾日");

settotalbar(XLength);


value1=FastHighestBar(volume,XLength);
value2=high[value1];

if value1<= length2 and value1>= length1 
and C>=value2 
then
ret = 1;
