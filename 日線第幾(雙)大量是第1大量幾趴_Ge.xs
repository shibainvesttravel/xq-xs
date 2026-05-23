{@type:filter|@guid:a70137eacb664c989a7d5dae7332cbde}

setbarfreq("D");
input: XLength(120, "長期大量計算期數");

settotalBar(XLength*2);

// 第一組比較排名與百分比
input: Nth_A(5, "基準量A：第幾大量"); 
input: percent1_A(50, "A小於幾趴");
input: percent2_A(10, "A大於幾趴");

// 第二組比較排名與百分比
input: Nth_B(10, "基準量B：第幾大量"); 
input: percent1_B(40, "B小於幾趴");
input: percent2_B(5, "B大於幾趴");

// 宣告陣列，長度預留到 50。如果您的 Nth_A 或 Nth_B 會超過 50，請把這裡調大
array: TopVolumes[50](0); 
// 修正：補上 value_A 與 value_B 的變數宣告
variable: i(0), j(0), tempV(0), k(0), maxNth(0), value_A(0), value_B(0);

// 自動找出兩個排名中較大的那一個，做為迴圈終點（提升效率）
maxNth = maxlist(Nth_A, Nth_B);

// 1. 初始化陣列
for i = 1 to maxNth begin
    TopVolumes[i] = 0;
end;

// 2. 核心運算：遍歷區間，找出前 maxNth 大的數值
for i = 0 to XLength - 1 begin
    tempV = volume[i];
    
    // 如果當前量大於目前紀錄中最後一名的量，才進行插入排序
    if tempV > TopVolumes[maxNth] then begin
        for j = 1 to maxNth begin
            if tempV > TopVolumes[j] then begin
                // 將第 j 名以後的數值往後移一位
                for k = maxNth downto j + 1 begin
                    TopVolumes[k] = TopVolumes[k - 1];
                end;
                TopVolumes[j] = tempV;
                break; 
            end;
        end;
    end;
end;

// 3. 取得對應數值
value3 = TopVolumes[1];      // 最大量
value_A = TopVolumes[Nth_A];  // 第 Nth_A 大量
value_B = TopVolumes[Nth_B];  // 第 Nth_B 大量

// 4. 同時滿足 A 與 B 的百分比條件才觸發
if value3 > 0 
   and value_A <= value3 * percent1_A * 0.01 and value_A >= value3 * percent2_A * 0.01
   and value_B <= value3 * percent1_B * 0.01 and value_B >= value3 * percent2_B * 0.01
then ret = 1;