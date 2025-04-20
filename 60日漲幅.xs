{@type:filter|@guid:56640dca26ef4faea9b48c7d51592a71}
setbarfreq("D");  // 設定時間週期為每日 (Day)

// 設定參數，讓使用者可以調整
input:percent1(0,"變動大於幾趴");   // 設定變動下限百分比
input:percent2(5,"變動小於幾趴");   // 設定變動上限百分比
input:period(60,"幾日內");           // 設定計算區間 (幾日內的變動)

// 設定總資料長度 (確保有足夠的歷史資料可計算)
settotalbar(period+1);

// 判斷當前收盤價相對於 period 天前的收盤價變動是否符合條件
if (c - c[period-1]) >= c[period-1] * (percent1 * 0.01)   // 變動大於等於 percent1%
   and (c - c[period-1]) <= c[period-1] * (percent2 * 0.01) // 變動小於等於 percent2%
then 
   ret = 1;  // 設定返回值為 1，表示符合條件


