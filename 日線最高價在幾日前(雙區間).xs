{@type:filter|@guid:97358c7fec15485f8bf7d92f7f79aaf5}
setbarfreq("D");
input:XLength(60,"區間1");
input:XLength1(160,"區間2");
input:Length1(0,"區間1大於幾日");
input:Length2(20,"小於幾日");
input:Length3(120,"區間2大於幾日");
input:Length4(160,"小於幾日");

SettotalBar(XLength1);

variable: PriceHighBar(0),VolumeHighBar(0);

value1=FastHighestBar(high,XLength);
value2=FastHighestBar(high,XLength1);


if value1<= length2 and value1>= length1 
and value2<= length4 and value2>= length3
then
ret = 1;

