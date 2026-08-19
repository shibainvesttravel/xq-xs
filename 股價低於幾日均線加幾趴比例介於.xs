{@type:filter|@guid:399ed83e9f5a48ad927db8debcbf74ca}
SetBarFreq("D"); // 設定頻率為日線

input: Leng1(60, "幾日均線");        // 均線長度 (預設60)
input: Leng2(60, "計算時期");        // 計算範圍（多少根K棒，預設60）
input: offset_pct(10, "均線加幾%(可負)"); // 均線平移百分比，例如 3 代表 均線+3%，-2 代表 均線-2%
input: percent(80, "最大百分比");     // 最大符合比例門檻 (%)
input: percent1(40, "最小百分比");    // 最小符合比例門檻 (%)

// 設定足夠的歷史資料筆數（需大於均線長度 + 統計範圍）
settotalBar(Leng1 + Leng2); 

variable: ma1(0), target_price(0);

// 計算均線
ma1 = average(C, Leng1); 

// 計算目標價位：均線 + 幾% (例如 ma1 * (1 + 3/100))
target_price = ma1 * (1 + offset_pct * 0.01);

// 計算最近 Leng2 根K棒中，收盤價「低於」目標價位的次數
value1 = countif(C < target_price, Leng2); 

// 判斷低於目標價的比例是否落在 percent1% ~ percent% 之間
if (value1 >= Leng2 * 0.01 * percent1) and (value1 <= Leng2 * 0.01 * percent) then 
begin
    ret = 1;
    outputField1(value1 / Leng2 * 100, "符合比例(%)");
end;
