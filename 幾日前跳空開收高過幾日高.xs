{@type:filter|@guid:2f82961dcc21467f8442a5711c0a4240}
setbarfreq("AD");
input:days1(10,"計算天期大於");
input:days2(40,"計算天期小於");
input:period1(10,"開過幾天高");  

SettotalBar(120);


condition1= h[1]<highest(h[2], period1-1) and low > highest(h[1],period1);



if barslast(condition1) >=days1 and barslast(condition1)<=days2
then ret=1;



