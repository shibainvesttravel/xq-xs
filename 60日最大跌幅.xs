{@type:filter|@guid:a944b45ed3d74dbba27d2b17771343ae}
setbarfreq("D"); 
// 設定日線為資料頻率

input: percent1(0, "變動大於幾趴");    // 跌幅下限百分比（例如 0%）
input: percent2(5, "變動小於幾趴");    // 跌幅上限百分比（例如 5%）
input: period(60, "幾日內");           // 計算的期間（例如 60 天）

settotalbar(period + 1);  
// 確保有足夠的資料供計算：需要至少 period + 1 根K棒

// 判斷期間內最低收盤價與 period 天前的收盤價的跌幅，是否介於 percent1% 到 percent2% 之間
if (c[period - 1] - lowest(c, period)) >= c[period - 1] * (percent1 * 0.01)
   and (c[period - 1] - lowest(c, period)) <= c[period - 1] * (percent2 * 0.01)
then 
   ret = 1; // 若符合條件，則回傳 1，代表此標的通過篩選

