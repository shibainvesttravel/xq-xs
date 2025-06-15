{@type:filter|@guid:3ba8dfc7c50143cfa088c8dd0283064a}
setbarfreq("W");
input:XLength(60,"計算期數");  //60周約1年 120周約2年 240周約4年
input:percent1(70,"大於高減低點幾%");

settotalBar(XLength);



Value1=fasthighest(h[1], Xlength); //value1=區間最高價
Value2=fastlowest(l[1],Xlength);   //value2=區間最低價


if  C>(value2+(value1-value2)*0.01*percent1)
 then
ret = 1;
