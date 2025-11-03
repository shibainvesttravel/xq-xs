{@type:filter|@guid:264f5846dfe143448bca7fcae62c96a7}
SetBarFreq("W");
input:Leng1(60,"幾周均線");
input:period1(10,"節點2");
input:period2(20,"節點3");
input:period3(30,"節點4");
input:period4(120,"節點5");
input:toppricepoint5(0,"5點最高節點位置");
input:bottompricepoint5(120,"最低節點位置");
input:toppricepoint4(0,"4點最高節點位置");
input:bottompricepoint4(30,"最低節點位置");
input:toppricepoint3(0,"3點最高節點位置");
input:bottompricepoint3(20,"最低節點位置");
input:toppricepoint2(0,"2點最高節點位置");
input:bottompricepoint2(10,"最低節點位置");
input:ratio1(1.1,"高低點比值大於");
input:ratio2(2,"高低點比值小於");

SettotalBar(period4+period3);

Value1 = average(c, Leng1);
value2 = value1[period1];
value3 = value1[period2];
value4 = value1[period3];
value5 = value1[period4];


if maxlist(value1, value2, value3, value4, value5)=value1[toppricepoint5]
    and minlist(value1, value2, value3, value4, value5)=value1[bottompricepoint5]
	and maxlist(value1, value2, value3, value4)=value1[toppricepoint4]
    and minlist(value1, value2, value3, value4)=value1[bottompricepoint4]
	and maxlist(value1, value2, value3)=value1[toppricepoint3]
    and minlist(value1, value2, value3)=value1[bottompricepoint3]
	and maxlist(value1, value2)=value1[toppricepoint2]
    and minlist(value1, value2)=value1[bottompricepoint2]
	and maxlist(value1, value2, value3, value4, value5)/minlist(value1, value2, value3, value4, value5)>=ratio1
	and maxlist(value1, value2, value3, value4, value5)/minlist(value1, value2, value3, value4, value5)<=ratio2
then 
ret = 1;

