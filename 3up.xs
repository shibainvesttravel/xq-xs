{@type:filter|@guid:f0f4fec5409b47bb8b70b0011b907786}
SetBarFreq("D");

// 腳本類型：選股
// 頻率建議：日線
input: Len1(5, "短天期(轉折線)"), Len2(15, "中天期(基準線)"), Len3(60, "長天期(先行帶)");

SettotalBar(Len3);

variable: Tenkan(0), Kijun(0), SpanA(0), SpanB(0);

// 計算轉換線與基準線
Tenkan = (Highest(High, Len1) + Lowest(Low, Len1)) / 2;
Kijun   = (Highest(High, Len2) + Lowest(Low, Len2)) / 2;

// 計算先行帶（因為雲帶平移 26 天，取 26 天前計算出的雲帶值對應當前 K 棒）
SpanA  = ((Highest(High[26], Len1) + Lowest(Low[26], Len1)) / 2 + 
          (Highest(High[26], Len2) + Lowest(Low[26], Len2)) / 2) / 2;
SpanB  = (Highest(High[26], Len3) + Lowest(Low[26], Len3)) / 2;

// 三役好轉條件判定
condition1 = Tenkan > Kijun;              // 轉折線大於基準線
condition2 = Close > SpanA and Close > SpanB; // 站上雲帶上方
condition3 = SpanA > SpanB;               // 多頭雲帶格局

if condition1 and condition2 and condition3 then
    Ret = 1;
