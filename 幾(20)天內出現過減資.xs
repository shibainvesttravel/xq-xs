{@type:filter|@guid:9966e81eea2d45b2900c1e0bd7e9c7f6}
SetBarFreq("D");
// 執行頻率：日線
// 腳本屬性請設定：資料讀取筆數 30 筆以上

SettotalBar(100);
Input:days(20,"幾日內");


// 取得減資新股上市日 (格式為 YYYYMMDD，若無則為 0)
Value1 = GetField("減資新股上市日");

// 確保有減資上市日資料，且上市日不是未來日期
if Value1 > 0 and Date >= Value1 then
begin
    // 計算自上市日以來至今經過了幾根日K (即交易日數)
    // 當 Date >= Value1 為 True 時累計根數
    Value2 = TrueCount(Date >= Value1, 100); 

    // 條件：上市日至今小於 20 個交易日（包含當天，即經過 1~19 個交易日）
    if Value2 > 0 and Value2 < days then
    begin
        Ret = 1;
        OutputField1(Value1, "減資上市日");
        OutputField2(Value2, "上市至今交易日數");
    end;
end;


