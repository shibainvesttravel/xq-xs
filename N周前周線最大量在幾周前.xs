{@type:filter|@guid:308cd1dac8e3438f83367f39b86b2b4b}
setbarfreq("W");
input:XLength(240,"長期計算期數");
input: Offset(10, "從幾周前開始計算");  // 新增偏移量
input:Length1(0,"大於幾周");
input:Length2(20,"小於幾周");


settotalbar(XLength + Offset);  // 確保數據包含 10 週前的資料

// 取 10 週前的數據作為起點，向前 240 週內尋找最高點
value1 = FastHighest(volume[Offset], XLength);  // 找最高價
value2 = FastHighestBar(volume[Offset], XLength);  // 找最高價出現的位置

if value2<= length2 and value2>= length1 then
ret = 1;


