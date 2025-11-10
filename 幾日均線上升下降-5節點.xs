{@type:filter|@guid:5c2434780c20403b9b05eeb54740e527}
SetBarFreq("D");
input:Leng1(60,"幾日均線");
input:period1(25,"節點2");
input:period2(50,"節點3");
input:period3(75,"節點4");
input:period4(100,"節點5");
input:toppricepoint5(0,"5點最高節點位置");
input:bottompricepoint5(50,"最低節點位置");
input:toppricepoint4(0,"4點最高節點位置");
input:bottompricepoint4(50,"最低節點位置");
input:toppricepoint3(0,"3點最高節點位置");
input:bottompricepoint3(50,"最低節點位置");
input:toppricepoint2(0,"2點最高節點位置");
input:bottompricepoint2(25,"最低節點位置");
input:ratio1(1.5,"高低點比值大於");
input:ratio2(2.5,"高低點比值小於");

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

