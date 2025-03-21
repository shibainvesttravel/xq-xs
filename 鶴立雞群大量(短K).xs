{@type:filter|@guid:b8abec6065034972aa0668b6e8dfaca2}
setbarfreq("D"); // 設定頻率為日線

// 設定輸入參數
input:XLength(240,"大量計算期數"); // 計算最大成交量的區間長度
input:XLength1(10,"幾日均量"); // 20 日均量
input:XLength2(60,"幾日均量"); // 60 日均量
input:XLength3(120,"幾日均量"); // 120 日均量
input:Length1(30,"幾日"); 
input:Length2(90,"幾日"); 
input:Multiplier1(3,"成交量倍數");  // 3 倍成交量閾值
input:Multiplier2(5,"成交量倍數");  // 5 倍成交量閾值
input:Multiplier3(10,"成交量倍數"); // 10 倍成交量閾值
input:Percent1(4,"K棒長度小於");
input:Percent2(1,"K棒長度大於");

settotalbar(XLength); // 設定總計算週期長度



// 計算最大成交量的時間點及數值
value1 = FastHighestBar(volume, XLength); // 取得 XLength 內最大成交量的索引位置
value2 = FastHighest(volume, XLength);   // 取得 XLength 內的最大成交量數值

// 計算不同週期的平均成交量
value11 = average(volume, XLength1);  // 10 日均量
value12 = average(volume, XLength2);  // 60 日均量
value13 = average(volume, XLength3);  // 120 日均量
value14 = average(volume, XLength);   // 240 日均量

value21=c[value1];
value22=o[value1];
value23=h[value1];
value24=l[value1];
value25=(value23-value24)/value21*100; //K棒長度


// 條件判斷: 當前最大成交量是否遠高於均量的閾值
if value1 >=length1 and value1<=length2 // 最大成交量柱是否為當前柱
 and value2 > value11 * Multiplier1  // 是否大於 10 日均量的 Multiplier1 倍
 and value2 > value12 * Multiplier2  // 是否大於 60 日均量的 Multiplier2 倍
 and value2 > value13 * Multiplier2  // 是否大於 120 日均量的 Multiplier2 倍
 and value2 > value14 * Multiplier3  // 是否大於 240 日均量的 Multiplier3 倍
 and value25<percent1 and value25>percent2
then ret = 1; // 符合條件則返回 1，表示信號觸發
