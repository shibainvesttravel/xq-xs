{@type:filter|@guid:19a3d1967f0846d783cdda92ed8fa639}
// MTM 終極放寬 A：連續幾天都在 0 軸之上
Input: Length(3);
Input: DaysCount(2, "連續幾天都在0軸上");

SetInputName(1, "動能期數");

settotalbar(Length + DaysCount + 5);

// 條件：MTM 大於 0
condition1 = Momentum(Close, Length) > 0;

// 高級寫法：利用 trueall 規定這幾天「天天都在 0 軸上」
Ret = trueall(condition1, DaysCount);