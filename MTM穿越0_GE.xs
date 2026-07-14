{@type:filter|@guid:c314ede3b5cd4b8abb868eb232156597}
// MTM往上穿越0軸
//
Input: Length(3, "期數");

// 優化點：多保留緩衝 K 棒，確保 Crosses Above 運算 100% 精準
settotalbar(Length + 5);

// 保持最精簡的高級寫法
Ret = Momentum(Close, Length) Crosses Above 0;