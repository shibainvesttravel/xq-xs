{@type:filter|@guid:612ab8e13a0b41c9bd46b6f514b97f22}
setbarfreq("W");

input: period1(50,"大於幾週平均");
input: percent1(5,"幾%");
input: period2(5,"大於幾週前");
input: percent2(3,"幾%");
input: number(600,"大戶持股低限");

settotalbar(period1+10);

Value1=Average(GetField("大戶持股比例","W",param:=number),period1);

condition1 = GetField("大戶持股比例","W",param:=number)>=value1*(1+percent1*0.01);
condition2 = GetField("大戶持股比例","W",param:=number)>=GetField("大戶持股比例","W",param:=number)[period2]*(1+percent2*0.01);


if condition1 and condition2  
 then ret=1;

