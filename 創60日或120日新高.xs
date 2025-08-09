{@type:filter|@guid:8b79eb52fcbb477cb563421c9e571aad}
setbarfreq("D");
input:XLength1(60,"計算期數");
input:XLength2(120,"計算期數");
input:Length1(0,"大於幾日");
input:Length2(5,"小於幾日");

settotalBar(XLength2);


value1=FastHighestBar(high,XLength1);
value2=FastHighestBar(high,XLength2);

condition1=value1<= length2 and value1>= length1;
condition2=value2<= length2 and value2>= length1;

if condition1 or condition2
then
ret = 1;

