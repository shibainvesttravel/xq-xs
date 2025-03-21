{@type:filter|@guid:0d3ea05e1174408380803462b2ddb7b7}
setbarfreq("D");
input:XLength(120,"計算期數");
input:Length1(20,"大於幾日");
input:Length2(70,"小於幾日");

settotalBar(XLength);


value1=FastHighestBar(high,XLength);


if value1<= length2 and value1>= length1 then
ret = 1;

