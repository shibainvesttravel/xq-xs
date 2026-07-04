{@type:filter|@guid:e7319620001341f883a88abc222c3a1c}
setbarfreq("W");
input: percent1(5, "漲幅變動大於幾趴");
input: percent2(50, "變動小於幾趴");
input: percent3(5, "跌幅變動大於幾趴");
input: percent4(50, "變動小於幾趴");
input: period(60, "幾周內");
input: period1(10, "幾周前");

// 【修正 Bug】最遠會讀取到 C[period + period1 - 1]（即第 69 根 K 線）
// 因此總 Bar 數設定必須大於等於 period + period1
settotalbar(period + period1);

variable: roc_value(0);

// RateOfChange(序列, 期數) 的公式為：((當前值 - 過去值) / 過去值) * 100
// 我們要計算從「69週前」到「10週前」的變動率，兩者相差 period - 1 (即 59 週)
roc_value = RateOfChange(Close[period1], period - 1);

// condition1：區間內「上漲」符合設定範圍
condition1 = roc_value >= percent1 and roc_value <= percent2;

// condition2：區間內「下跌」符合設定範圍（注意：ROC 下跌時為負數，故加上負號判斷）
condition2 = roc_value <= -percent3 and roc_value >= -percent4;

if condition1 or condition2 then ret = 1;
