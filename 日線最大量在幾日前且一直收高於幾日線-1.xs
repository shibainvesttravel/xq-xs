{@type:filter|@guid:6bb76b6002474d5a8d59e8faab587201}
setbarfreq("D");
input:XLength(120,"長期大量計算期數");
input:Length1(5,"大於幾日");
input:Length2(30,"小於幾日");
input:Length3(5,"幾日線");

settotalbar(XLength);

value1=FastHighestBar(volume,XLength); // 區間內最大量K位置
value2=FastHighest(volume,XLength);    // 區間內最大量數值
value3=average(c,length3);
value4=Low[value1];
value5=FastHighestBar(h,XLength); // 


if value1<= length2 and value1>= length1 
and trueall(C>=value3, value1)
and trueall(C>=value4, value1)
and value5<=(value1-1)
then
ret = 1;
