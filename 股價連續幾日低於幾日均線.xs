{@type:filter|@guid:6ab80cf9604549e2b5ac791dbae9aa11}
SetBarFreq("D");
input: Leng1(20, "幾日均線");
input: ConsecutiveDays(3, "連續幾天低於均線"); // 

variable: ma1(0);

settotalBar(60);

ma1 = average(c, Leng1);

// 判斷收盤價是否低於均線
condition1 = c < ma1;

// 使用 TrueAll 函數，判斷 condition1 是否連續指定天數都成立
if TrueAll(condition1, ConsecutiveDays) then
    ret = 1;


