{@type:filter|@guid:bd0f156d32384ac8ac1881e4ce32827f}
setbarfreq("D");
input: Length1(3,"均量區間1");
input: Length2(6,"均量區間2");
input: VolFactor(2.5,"比例");
input: XLength1(60,"大量計算期數");
input: Percent1(50,"大量幾%");

settotalbar(XLength1);

value1=FastHighestBar(volume,XLength1); 
value2=FastHighest(volume,XLength1);    
 

condition1= Average(Volume, Length1)<  Average(Volume[length1], Length2)* VolFactor;
condition2= Value1>length1 and Average(Volume, Length1)<value2*percent1*0.01;

If condition1 or condition2
then 
ret=1;
