{@type:filter|@guid:2ab0450cc3ef4d049fd64258caeaa397}
SetBarFreq("D");
input:Leng1(60,"幾日均線");
input:period1(10,"節點2");
input:period2(30,"節點3");
input:period3(60,"節點4");
input:toppricepoint4(0,"4點最高節點位置");
input:bottompricepoint4(60,"最低節點位置");
input:toppricepoint3(0,"3點最高節點位置");
input:bottompricepoint3(30,"最低節點位置");
input:ratio1(1.1,"高低點比值大於");
input:ratio2(2,"高低點比值小於");
input:ratioC(0.05,"曲度比值大於");
input:ratioC1(0.02,"曲度比值大於");

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
	and (value1/value2)>(value2/value3)*(1+ratioC)
	and (value2/value3)>(value3/value4)*(1+ratioC1)
then 
ret = 1;

