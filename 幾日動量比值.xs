{@type:filter|@guid:043f2c12920240f98d75cbc51c2e6fd9}
setbarfreq("D");



// 腳本類型：選股腳本 (適用於日線)
// 功能：計算短期與長期平均動量的比值，並篩選出比值介於 A 與 B 之間的股票。

// --- 外部參數設定 ---
// 你可以在選股設定介面隨時調整這些數值
input: ShortLength(3, "短期天數(N日)");
input: LongLength(10, "長期天數(M日)");
input: Ratio_A(0, "比值下限(A)"); // 例如：0.8，代表短期平均是長期的 80%
input: Ratio_B(1, "比值上限(B)"); // 例如：1.2，代表短期平均是長期的 120%

settotalbar(LongLength*3);

// --- 宣告內部變數 ---
variable: BarPower(0), ShortAvgPower(0), LongAvgPower(0), PowerRatio(0);
variable: Target_Start(0), Target_End(0);

// --- 核心計算邏輯 ---

// --- A. 安全性與區間修正 (修正 minValue 問題) ---
// 這裡將原本出錯的 minValue 移除，在程式中檢查
variable: C_Short(0), C_Long(0);
if ShortLength >= 1 then C_Short = ShortLength else C_Short = 1; // 確保短期至少 1 日
if LongLength >= C_Short + 1 then C_Long = LongLength else C_Long = C_Short + 1; // 確保長期大於短期

// 確保區間設定正確 (A < B)，交換
if Ratio_A <= Ratio_B then
begin
    Target_Start = Ratio_A;
    Target_End = Ratio_B;
end
else
begin
    Target_Start = Ratio_B;
    Target_End = Ratio_A;
end;


// --- B. 計算動能序列 ---
// 1. 定義 K 棒動能 = 整根K棒全振幅 (High-Low) * 成交量
BarPower = Volume * (High - Low);


// --- C. 計算平均動能 ---
// 2. 計算 短期 N 日的動能平均
ShortAvgPower = Average(BarPower, C_Short);

// 3. 計算 長期 M 日的動能平均
LongAvgPower = Average(BarPower, C_Long);


// --- D. 計算比值與篩選條件 ---
// 4. 計算 短期平均 / 長期平均 的比值
if LongAvgPower > 0 then // 過濾極端冷門股 (除以零)
begin
    PowerRatio = ShortAvgPower / LongAvgPower;
end
else
begin
    PowerRatio = 0; // 若長期無量或無波動，比值設為 0
end;


// 5. 核心篩選：判斷比值是否在區間內
// 如果 PowerRatio 介於 Target_Start 和 Target_End 之間，條件成立
if PowerRatio >= Target_Start and PowerRatio <= Target_End then
begin
    // 符合條件，篩選出此股票
    ret = 1; 

    // 輸出欄位供選股清單檢視與排序 (選用)
    outputfield1(PowerRatio, "動能比值(N/M)");
    outputfield2(ShortAvgPower, "短期平均動能");
    outputfield3(LongAvgPower, "長期平均動能");
end;