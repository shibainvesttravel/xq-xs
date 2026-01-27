{@type:filter|@guid:52429f267f9044f388d5d60233b1ff04}
setbarfreq("D");
input: XLength(120, "計算總期數(觀察窗口)");
input: LengthMin(0, "最大量位置下限");
input: LengthMax(20, "最大量位置上限");
input: PercentMin(0, "高於高點天數比例下限%");
input: PercentMax(20, "高於高點天數比例上限%");

variable: maxVolIdx(0), maxVolPrice(0), i(0), hitCount(0), winRate(0);

// 1. 找出 120 天內的最高量位置
maxVolIdx = FastHighestBar(volume, XLength); 

// 2. 取得該最高量的收盤價 (固定基準)
maxVolPrice = close[maxVolIdx]; 

// 3. 使用迴圈計算在「整個 XLength 區間」內，收盤價高於該基準的天數
hitCount = 0;
for i = 0 to (XLength - 1) begin
    if close[i] > maxVolPrice then begin
        hitCount += 1;
    end;
end;

// 4. 計算比例：在 120 天中佔了多少天
winRate = (hitCount / XLength) * 100;

// 5. 判斷條件
// maxVolIdx 代表最大量發生在幾天前
if maxVolIdx <= LengthMax and maxVolIdx >= LengthMin
   and winRate >= PercentMin and winRate <= PercentMax
then 
begin
    ret = 1;
    outputfield(1, maxVolIdx, 0, "最大量位置(天前)");
    outputfield(2, maxVolPrice, 2, "最大量當日收盤價");
    outputfield(3, winRate, 1, "固定區間內高於價格之比例%");
end;