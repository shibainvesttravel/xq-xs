{@type:filter|@guid:f5cb9e06192a4827b9083dc670bf7bb3}
SetBarFreq("D");
input:period1(5, "連續幾日上漲");


// 設定運算所需的最少Bar數
settotalBar(period1*2);

// 判斷是否連續 period1 天，每天的收盤價都大於昨日收盤價


if trueall(c > c[1], period1)
 then
    ret = 1;

