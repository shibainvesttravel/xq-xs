{@type:filter|@guid:6654f313d04246deb90294897724fc29}
setbarfreq("D");
input: XLength(120, "長期大量計算期數");
input: Nth(10, "第幾大量"); // 新增：可調整要取第幾名
input: percent1(50, "小於幾趴");
input: percent2(10, "大於幾趴");

settotalBar(XLength*2);

// 宣告陣列，長度建議設為你預期 Nth 可能的最大值（例如 50）
array: TopVolumes[50](0); 
variable: i(0), j(0), tempV(0), k(0);

// 1. 初始化陣列 (只清理到 Nth 指定的範圍即可)
for i = 1 to Nth begin
    TopVolumes[i] = 0;
end;

// 2. 核心運算：遍歷區間找出前 Nth 大的數值
for i = 0 to XLength - 1 begin
    tempV = volume[i];
    
    // 如果當前量大於目前紀錄中最後一名的量，才進行插入排序
    if tempV > TopVolumes[Nth] then begin
        for j = 1 to Nth begin
            if tempV > TopVolumes[j] then begin
                // 將第 j 名以後的數值往後移一位
                for k = Nth downto j + 1 begin
                    TopVolumes[k] = TopVolumes[k - 1];
                end;
                TopVolumes[j] = tempV;
                break; 
            end;
        end;
    end;
end;

// 3. 邏輯判斷
// value3 為最大量 (第一名)
// value4 為使用者指定的第 Nth 大量
value3 = TopVolumes[1];
value4 = TopVolumes[Nth];

if value3 > 0 and value4 <= value3 * percent1 * 0.01 
   and value4 >= value3 * percent2 * 0.01 
then ret = 1;