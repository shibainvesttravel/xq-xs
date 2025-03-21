{@type:filter|@guid:43b92bd17a4140fcaa93835a6e71b1f3}
setbarfreq("D");
input:XLength(120,"長期大量計算期數");
input:Length1(20,"大於幾日");
input:Length2(70,"小於幾日");

settotalbar(XLength);

value1=FastHighestBar(volume,XLength); // 區間內最大量K位置
value2=FastHighest(volume,XLength);    // 區間內最大量數值


if value1<= length2 and value1>= length1 then
ret = 1;
