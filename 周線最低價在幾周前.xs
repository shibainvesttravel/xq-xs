{@type:filter|@guid:8a431339240546f0a0957d672a4bd496}
setbarfreq("W");
input:XLength(60,"長期大量計算期數");
input:Length1(20,"大於幾周");
input:Length2(60,"小於幾周");

SettotalBar(XLength);

value1=FastLowestBar(low,XLength);


if value1<= length2 and value1>= length1 then
ret = 1;

