{@type:filter|@guid:35626f12a34f4d499fe41f096c03db32}
setbarfreq("D");
input:XLength(240,"長期大量計算期數");
input:Length1(0,"大於幾日");
input:Length2(0,"小於幾日");
input:Length3(0,"大於幾日");
input:Length4(0,"小於幾日");
input:percent1(5,"紅K長");

settotalbar(XLength);

variable: PriceHighBar(0),VolumeHighBar(0);

value1=FastHighestBar(volume,XLength);
value2=FastHighestBar(high,XLength);
value3=FastHighest(volume,XLength);

condition1= value1<= length2 and value1>= length1 and value2<= length4 and value2>= length3 ;
condition2= Volume>value3*0.85 and C>O*(1+percent1*0.01);
condition3= condition1 or condition2;

if condition3 
then
ret = 1;
