{@type:filter|@guid:41bf232bd3f641abb75f6aed8c8c81b2}
setbarfreq("D");
input:XLength(60,"計算期數");
input:Length1(20,"大於幾日");
input:Length2(60,"小於幾日");

settotalBar(XLength);


value1=FastHighestBar(high,XLength);


if value1<= length2 and value1>= length1 then
ret = 1;

