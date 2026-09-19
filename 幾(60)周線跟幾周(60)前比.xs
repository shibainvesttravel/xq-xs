{@type:filter|@guid:4db1eb3b8d7a40b8b4accc80030a44a5}
SetBarFreq("W");

setbarfreq("W"); // 直接強制指定為週頻率

input: WeekLength(60, "週均線期數(如5週、10週、20週)");
input: LookbackWeeks(60, "回溯比較幾週前(幾週前)");
input: RatioMin(0.8, "比值下限");
input: RatioMax(2.0, "比值上限");

settotalbar(WeekLength + LookbackWeeks + 5);

var: CurWeekMA(0), PastWeekMA(0), Ratio(0);

// 計算當週均線
CurWeekMA = Average(Close, WeekLength);

// 取得 N 週前的均線值
PastWeekMA = CurWeekMA[LookbackWeeks];

if PastWeekMA > 0 then
begin
    // 計算比值
    Ratio = CurWeekMA / PastWeekMA;

    // 輸出到選股清單
    outputfield1(Ratio, 4, "均線比值");
    outputfield2(CurWeekMA, 2, "當前週MA");
    outputfield3(PastWeekMA, 2, "前期週MA");

    // 篩選區間
    if Ratio >= RatioMin and Ratio <= RatioMax then
    begin
        ret = 1;
    end;
end;