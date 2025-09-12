{@type:filter|@guid:acd77b9abed14a808f091ca8bbbfcb70}
setbarfreq("D");
input:XLength(120,"長期大量計算期數");
input:Length1(5,"大於幾日");
input:Length2(20,"小於幾日");
input:Length3(20,"幾日線");
input:percent1(2,"跳空缺口大於");
input:percent2(30,"跳空缺口小於");

settotalbar(XLength);

value1=FastHighestBar(volume,XLength); // 區間內最大量K位置
value2=FastHighest(volume,XLength);    // 區間內最大量數值
value3=average(c,length3);
value4=Low[value1];
value5=FastHighestBar(h,XLength); 
Value11=H[value1];
Value12=L[value1];
Value13=C[value1];
Value14=O[value1];
Value15=H[value1+1];


if value1<= length2 and value1>= length1 
and trueall(C>=value3, value1)
and Value12>=value15*(1+percent1*0.01)
and Value12<=value15*(1+percent2*0.01)
and value5<=value1
then
ret = 1;
