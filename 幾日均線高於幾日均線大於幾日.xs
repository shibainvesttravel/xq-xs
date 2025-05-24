{@type:filter|@guid:6fa8f94538184f46aa3cac38706045eb}
SetBarFreq("D");
input:Leng1(20,"均線較高");
input:Leng2(60,"均線較低");
input:Period(1,"持續幾天");

settotalbar(period+1);

Value1 = average(c, Leng1);
Value2 = average(c, Leng2);

if trueall(value1> value2, period)
then 
ret = 1;

