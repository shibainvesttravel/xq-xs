{@type:filter|@guid:bcad822b98554f7a950fd4909657ca5e}
// 設定條件頻率為每日
setbarfreq("W");

// 輸入參數設定
input: 
    XLength(120, "長期大量計算期數"),   // 計算過去多少天的最大成交量
    Length1(40, "大於幾日"),            // 出現大量的最小天數限制
    Length2(120, "小於幾日"),           // 出現大量的最大天數限制
	Percent1(0, "大於幾%"),            
    Percent2(30, "小於幾%");            
	
// 設定計算的總K棒數為XLength
settotalbar(XLength);

// 找出過去XLength期間內的最大成交量出現的K棒數（距離現在幾天前）
value1 = FastHighestBar(volume, XLength);

// 取得當時的收盤價（或高點價位）
value2 = H[value1];  // 可改為C[value1]如果想比較收盤價

// 判斷條件：最大量K棒在指定區間內，且當前收盤價大於當時高點
if value1 <= Length2 and value1 >= Length1 
and C > value2*(1+percent1*0.01) and C < value2*(1+percent2*0.01) then
    ret = 1; // 符合條件，回傳1（可做後續交易用）

