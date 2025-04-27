{@type:filter|@guid:99d1f55f67934bfd9c1debb7c92d25b4}
setbarfreq("W");

input: XLength(60, "區間1");
input: XLength1(120, "區間2");
input: XLength2(180, "區間3");
input: XLength3(240, "區間4");  // 區間4

input: Length1(0, "區間1大於幾周");
input: Length2(60, "小於幾周");
input: Length3(0, "區間2大於幾周");
input: Length4(120, "小於幾周");
input: Length5(0, "區間3大於幾周");
input: Length6(180, "小於幾周");
input: Length11(0, "區間4大於幾周");  // 新增區間4條件
input: Length12(240, "小於幾周");     // 新增區間4條件

input: Length7(0, "最大量大於幾周");
input: Length8(240, "小於幾周");
input: Length9(0, "最低價大於幾周");
input: Length10(240, "小於幾周");

input: Xfactor1(2, "高點高於低點幾倍");
input: Xfactor2(4, "高點低於低點幾倍");
input: percent1(0, "大於高減低點幾%");
input: percent2(100, "小於高減低點幾%");

SettotalBar(XLength3);  



value1 = FastHighestBar(high, XLength);
value2 = FastHighestBar(high, XLength1);
value3 = FastHighestBar(high, XLength2);
value13 = FastHighestBar(high, XLength3);  // 區間4

value4 = FastHighest(high, XLength);
value5 = FastHighest(high, XLength1);
value6 = FastHighest(high, XLength2);
value14 = FastHighest(high, XLength3);     // 區間4

value7 = FastHighestBar(volume, XLength3);
value8 = FastLowest(low, XLength3);
value9 = FastLowestBar(low, XLength3);

value11 = FastHighest(high, XLength3);
value12 = FastLowest(low, XLength3);

// 加上區間4的條件
if value1 <= Length2 and value1 >= Length1
   and value2 <= Length4 and value2 >= Length3
   and value3 <= Length6 and value3 >= Length5
   and value13 <= Length12 and value13 >= Length11
   and value7 <= Length8 and value7 >= Length7
   and value9 <= Length10 and value9 >= Length9
   and value14 >= value8 * Xfactor1
   and value14 <= value8 * Xfactor2
   and Close >= (value12 + (value11 - value12) * 0.01 * percent1)
   and Close <= (value12 + (value11 - value12) * 0.01 * percent2)
then
   ret = 1;
