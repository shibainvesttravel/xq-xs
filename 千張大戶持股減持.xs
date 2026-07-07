{@type:filter|@guid:1dc3ca4b43de42319181b02b4745214f}
setbarfreq("W");

input: period1(5,"小於幾週平均");
input: percent1(1,"幾%");
input: period2(1,"小於幾週前");
input: percent2(2,"幾%");
input: number(600,"大戶持股低限");

settotalbar(period1+10);

Value1=Average(GetField("大戶持股比例","W",param:=number),period1);

condition1 = GetField("大戶持股比例","W",param:=number)<=value1*(1-percent1*0.01);
condition2 = GetField("大戶持股比例","W",param:=number)<=GetField("大戶持股比例","W",param:=number)[period2]*(1-percent2*0.01);


if condition1 or condition2  
 then ret=1;

