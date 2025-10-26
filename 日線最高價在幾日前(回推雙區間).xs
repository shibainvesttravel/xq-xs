{@type:filter|@guid:8bb7e2a9100a4e4a90db1e90080ee0d5}

setbarfreq("D");
input:XLength(120,"區間1");
input:XLength1(10,"區間1往前推幾日");
input:Length1(0,"區間1大於幾日");
input:Length2(20,"小於幾周");
input:Length3(20,"區間2大於幾日");
input:Length4(110,"小於幾日");

SettotalBar(XLength);

variable: PriceHighBar(0),VolumeHighBar(0);

value1=FastHighestBar(high,XLength);
value2=FastHighestBar(high,(XLength-Xlength1))[Xlength1];



if value1<= length2 and value1>= length1 
and value2<= length4 and value2>= length3
then
ret = 1;

