{@type:filter|@guid:546178c168b742e5ac9f5f81e4b2cdcd}
setbarfreq("D");
input:XLength(120,"長期大量計算期數");
input:Length1(20,"大於幾日");
input:Length2(70,"小於幾日");

SettotalBar(XLength);


value1=FastLowestBar(low,XLength);


if value1<= length2 and value1>= length1 then
ret = 1;

