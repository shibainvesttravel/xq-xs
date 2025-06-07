{@type:filter|@guid:e2ed1c814ec54a42aa0f8e8cb573b982}
SetBarFreq("W");
input:Leng1(60,"幾周均線");
input:period1(10,"節點2");
input:period2(20,"節點3");
input:period3(120,"節點4");
input:toppricepoint4(0,"4點最高節點位置");
input:bottompricepoint4(120,"最低節點位置");
input:toppricepoint3(0,"3點最高節點位置");
input:bottompricepoint3(20,"最低節點位置");
input:ratio1(1.1,"高低點比值大於");
input:ratio2(2,"高低點比值小於");

SettotalBar(period3+period2);

Value1 = average(c, Leng1);
value2 = value1[period1];
value3 = value1[period2];
value4 = value1[period3];


if maxlist(value1, value2, value3, value4)=value1[toppricepoint4]
    and minlist(value1, value2, value3, value4)=value1[bottompricepoint4]
	and maxlist(value1, value2, value3)=value1[toppricepoint3]
    and minlist(value1, value2, value3)=value1[bottompricepoint3]
	and maxlist(value1, value2, value3, value4)/minlist(value1, value2, value3, value4)>=ratio1
	and maxlist(value1, value2, value3, value4)/minlist(value1, value2, value3, value4)<=ratio2
then 
ret = 1;

