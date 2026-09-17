{@type:filter|@guid:bd1b381e8c4c4a6dab27071b0ebf5ee1}
setbarfreq("d");

// 參數宣告（統一語意與預設值）
input: p_shift(10,  "基準距今天數(棒)");
input: p_lookback(60, "回溯計算天數(棒)");
input: up_min(0,    "漲幅下限(%)");
input: up_max(100,  "漲幅上限(%)");
input: down_min(0,  "跌幅下限(%)");
input: down_max(20, "跌幅上限(%)");

// 安全設定：足夠包含回溯點的歷史長度
settotalbar(p_shift + p_lookback + 5);

// 提取起訖點收盤價
var: base_close(0), start_close(0), chg_pct(0);

base_close  = Close[p_shift];
start_close = Close[p_shift + p_lookback - 1];

// 防呆避免除以 0
if start_close > 0 then
begin
    // 計算報酬率百分比 (帶正負號)
    chg_pct = (base_close - start_close) / start_close * 100;

    // 分流判斷：上漲區間 或 下跌區間
    condition1 = (chg_pct >= 0) and (chg_pct >= up_min)   and (chg_pct <= up_max);
    condition2 = (chg_pct < 0)  and (absvalue(chg_pct) >= down_min) and (absvalue(chg_pct) <= down_max);

    if condition1 or condition2 then
    begin
        ret = 1;
        outputfield1(chg_pct, 2, "區間漲跌幅(%)");
    end;
end;
