{@type:filter|@guid:35a80a2ba9fb4f708137748aa8abf4f4}
setbarfreq("D");
Input:period1(0,"大於幾日");
Input:period2(10,"小於幾日");
Input:length1(5,"短天期");
Input:length2(20,"長天期");

settotalBar(length2*3);

Value1=average(c,length1);
Value2=average(c,length2);
Value3=barslast (value1 cross over value2);
If value3>=period1 and value3<=period2
Then 
Ret=1;
