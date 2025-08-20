{@type:filter|@guid:e963ee31d9f2410b9c092d2abda51612}
SetBarFreq("W");
input:Leng1(60,"短周");
input:Leng2(120,"中周");
input:Leng3(240,"長周");
input:Percent(3,"幾%");

settotalbar(20);

Value1 = average(c, Leng1);
Value2 = average(c, Leng2);
Value3 = average(c, Leng3);

condition1= value1> value2 and value1>value3;
condition2= value1> minlist(value2,value3) and value1>maxlist(value2, value3)*(1-percent*0.01);

if 
condition1 or condition2
then 
ret = 1;

