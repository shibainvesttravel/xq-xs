{@type:filter|@guid:97614e30f2e141409dabce92125e3317}
setbarfreq("D"); 
// 設定使用日線資料

input: percent1(0, "變動大於幾趴");   
input: percent2(5, "變動小於幾趴");   
input: period(60, "幾日內");           

settotalbar(period + 1);  
// 確保有足夠資料：最少要有 period+1 根K棒

// 計算近 period 天內的最高價與 period 天前的收盤價之間的漲幅
if (highest(c, period) - c[period - 1]) >= c[period - 1] * (percent1 * 0.01)
   and (highest(c, period) - c[period - 1]) <= c[period - 1] * (percent2 * 0.01)
then
   ret = 1; // 若變動百分比介於 percent1~percent2% 之間，回傳 1，代表符合條件

