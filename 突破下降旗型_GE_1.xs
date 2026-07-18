{@type:filter|@guid:a5787820ab424ce6885671e408cdd72d}
input: Length(100);		Setinputname(1, "區間");
input: UpRatio(2);		SetInputName(2, "當日上漲幅度下限%");
input: MaxUpRatio(7);	SetInputName(3, "當日上漲幅度上限%"); // 新增：防止追高上限
input: VolLimit(300);	SetInputName(4, "當日成交量下限");

variable: KeyPrice(0), HighPrice(0), BarCount(0);

settotalbar(Length + 5); 

// 1. 尋找區間最高點，並用 BarCount 記錄距離今天幾根 K 線
if high = highest(high, Length) then 
begin
	BarCount = 0;
end
else 
begin
	BarCount = BarCount + 1;
end;

// 2. 記錄關鍵價位（最高點當天收盤價，與隔天最高價）
if BarCount = 0 and BarCount[1] > 0 then KeyPrice = Close;
if BarCount = 1 and BarCount[1] = 0 then HighPrice = High;

// 3. 設定爆量條件：當天成交量需大於 5 日均量的 1.5 倍，且高於基本下限
variable: VolTrigger(false);
VolTrigger = volume > VolLimit and volume > average(volume, 5) * 1.5;

// 4. 計算當日實體紅 K 的漲幅百分比
variable: RealBodyRatio(0);
RealBodyRatio = ((Close - Open) / Open) * 100;

// 5. 多頭突破選股條件
if KeyPrice > 0 and HighPrice > 0 
	and BarCount > 2                // 至少沉澱整理 3 根 K 線以上
	and BarCount <= Length / 2      // 整理時間不超過區間的一半
	and RealBodyRatio >= UpRatio    // 實體紅 K 漲幅大於下限（例如 2%）
	and RealBodyRatio <= MaxUpRatio // 新增：實體紅 K 漲幅小於上限（例如 7%）
	and Close >= highest(High, 3)   // 突破近 3 日短高
	and VolTrigger                  // 滿足爆量動能
	and Close > KeyPrice            // 成功收復創高當天的收盤頸線
	and Close < HighPrice           // 尚未過熱追高
then ret = 1;