{@type:filter|@guid:c8a896b4217d4f63af4235def677ad3b}
setbarfreq("D");
input: XLength(120, "長期大量計算期數");
input: Nth(3, "第幾大量"); 
input: percent1(90, "第N大量小於最大量幾%");
input: percent2(10, "第N大量大於最大量幾%");

// === 新增/修改：第一最大量的位置區間設定 ===
input: MaxBarMinOffset(0, "第一大量位置下限(幾根K棒前)"); 
input: MaxBarMaxOffset(120, "第一大量位置上限(幾根K棒前)"); 

// === 新增：第 N 最大量的位置區間設定 ===
input: NthBarMinOffset(0,  "第N大量位置下限(幾根K棒前)"); 
input: NthBarMaxOffset(120, "第N大量位置上限(幾根K棒前)"); 

settotalBar(XLength * 2);

// 宣告兩個陣列：一個存成交量，一個存對應的 K 棒相對位置
array: TopVolumes[50](0), TopBars[50](0); 
variable: i(0), j(0), tempV(0), tempB(0), k(0);
variable: MaxVolume(0), TargetVolume(0), MaxBarOffset_Actual(0), NthBarOffset_Actual(0);
variable: cond_ratio(false), cond_max_pos(false), cond_nth_pos(false);

// 1. 初始化陣列
for i = 1 to Nth begin
    TopVolumes[i] = 0;
    TopBars[i] = 0;
end;

// 2. 核心運算：遍歷區間，同步紀錄數值與位置
for i = 0 to XLength - 1 begin
    tempV = volume[i];
    tempB = i; // 紀錄這根 K 棒距離目前是幾根 K 棒前 (0 代表當天)
    
    // 如果當前量大於目前紀錄中最後一名的量，才進行插入排序
    if tempV > TopVolumes[Nth] then begin
        for j = 1 to Nth begin
            if tempV > TopVolumes[j] then begin
                
                // 將第 j 名以後的數值與位置同時往後移一位
                for k = Nth downto j + 1 begin
                    TopVolumes[k] = TopVolumes[k - 1];
                    TopBars[k] = TopBars[k - 1];
                end;
                
                // 放入新數據
                TopVolumes[j] = tempV;
                TopBars[j] = tempB;
                break; 
            end;
        end;
    end;
end;

// 3. 取得對應數值與位置
MaxVolume = TopVolumes[1];           // 最大量
TargetVolume = TopVolumes[Nth];      // 第 Nth 大量
MaxBarOffset_Actual = TopBars[1];    // 第一最大量實際距離現在幾根 K 棒
NthBarOffset_Actual = TopBars[Nth];  // 【新增】第 N 最大量實際距離現在幾根 K 棒

// 4. 條件判斷

// 條件 A：量能比例條件
cond_ratio = (MaxVolume > 0) 
             and (TargetVolume <= MaxVolume * percent1 * 0.01) 
             and (TargetVolume >= MaxVolume * percent2 * 0.01);

// 條件 B：第一最大量的位置，必須落在設定的【上限與下限之內】
cond_max_pos = (MaxBarOffset_Actual >= MaxBarMinOffset) 
               and (MaxBarOffset_Actual <= MaxBarMaxOffset);

// 條件 C：第 N 最大量的位置，必須落在設定的【上限與下限之內】
cond_nth_pos = (NthBarOffset_Actual >= NthBarMinOffset) 
               and (NthBarOffset_Actual <= NthBarMaxOffset);


// 三個條件必須同時滿足
if cond_ratio and cond_max_pos and cond_nth_pos then 
    ret = 1;