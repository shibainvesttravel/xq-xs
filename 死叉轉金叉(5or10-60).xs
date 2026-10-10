{@type:filter|@guid:15b3486340334856b2e7d6557528ff2e}
setbarfreq("D");
input:XLength(60,"計算期數");
input:XLength1(120,"計算期數");
input:Leng1(5,"短均線");
input:Leng2(10,"中均線");
input:Leng3(20,"長均線");
input:Leng4(60,"短均線");
input:Leng5(120,"中均線");
input:Leng6(240,"長均線");
input:period1(1,"大於幾日");
input:period2(15,"小於幾日");
input:period3(20,"大於幾日");
input:period4(120,"小於幾日");
input:percent1(0.005,"間距1");
input:percent2(0.005,"間距2");
input:percent3(0.5,"間距3");


SettotalBar(Leng6);

variable: ma1(0), ma2(0), ma3(0),ma4(0), ma5(0), ma6(0);

ma1 = average(c,Leng1);
ma2 = average(c,Leng2);
ma3 = average(c,Leng3);
ma4 = average(c,Leng4);
ma5=  average(c,Leng5);
ma6 = average(c,Leng6);

Value1=barslast (ma1 cross over ma4);
Value2=barslast (ma2 cross over ma4);
value11=FastHighest(c,Xlength);   
value12=absvalue(c-value11[30])*100/c;
value13=FastHighestbar(volume,Xlength1);  
value14=FastLowest(c,Xlength1); 
value15=absvalue(c-value14)*100/value14;

if value1>=period1 and value1<=period2
and value2>=period1 and value2<=period2
and trueall(ma1>ma2,5)
//and ma4>=maxlist(ma5, ma6)
//and value13>=period3 and value13<=period4
//and ma1>ma2 and ma2>ma3
//and value12<20
//and value15<50
and trueall(C>ma4, value1-1)
and C<ma4*1.5
then 
ret = 1;







