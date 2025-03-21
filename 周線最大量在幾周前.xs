{@type:filter|@guid:69fe60895ee1440a82c8458322c1abd0}
// 設定條件頻率為每週（W = Weekly）
setbarfreq("W");

// 輸入參數
input:
    XLength(60, "長期大量計算期數"),    // 計算過去幾週的最大成交量
    Length1(10, "大於幾周"),            // 最小週數限制（距今至少這麼久以前）
    Length2(40, "小於幾周");            // 最大週數限制（距今至多這麼久以前）

// 設定總K棒數為XLength，確保回溯資料足夠
settotalbar(XLength);

// 找出過去 XLength 週內成交量最大的 K 棒位置（距今幾週前）
value1 = FastHighestBar(volume, XLength);

// 判斷：最大成交量發生的位置是否在距今 Length1 到 Length2 週之間
if value1 <= Length2 and value1 >= Length1 then
    ret = 1;  // 若條件符合，回傳 1，可作為訊號觸發依據

