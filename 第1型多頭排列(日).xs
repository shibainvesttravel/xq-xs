{@type:filter|@guid:889beff223ca4a85b1dd877394a70a79}

// 設定時間頻率為每日
SetBarFreq("D");

// 輸入參數：三條均線長度、條件計算的區間、與均線間距的百分比門檻
input:
    Leng1(5, "短均線"),
    Leng2(10, "中均線"),
    Leng3(20, "長均線"),
    period1(6, "連續天數大於"),
    percent1(0.005, "間距1"),
    percent2(0.01, "間距2");

// 宣告變數
variable: 
    ma1(0),  // 短期均線
    ma2(0),  // 中期均線
    ma3(0);  // 長期均線

// 設定最少需要的K棒數，以便後面條件計算
settotalBar(period1 * 2);

// 計算三條移動平均線
ma1 = average(c, Leng1);
ma2 = average(c, Leng2);
ma3 = average(c, Leng3);

// 均線比例與距離變化
value1 = ma1 / ma2;                       // 短/中期均線比
value2 = ma2 / ma3;                       // 中/長期均線比
value3 = absvalue(ma1 - ma2);            // 短-中之間的距離
value4 = absvalue(ma2 - ma3);            // 中-長之間的距離
value5 = countif(value3 < value4, period1); // 在 period1 天內有幾天是 短-中 距離 < 中-長 距離

// 條件判斷（均線呈現發散結構並站上中期均線）
if 
    trueall(value2 > (1 + percent2), period1)   // 中期均線遠離長期均線，表現強勢
and trueall(value3 < value4, ceiling(period1 / 2))  // 至少一半時間短-中距離 < 中-長距離，均線發散合理
and trueall(c > ma2, period1)  // 收盤價連續站上中期均線
then 
    ret = 1;  // 發出訊號





