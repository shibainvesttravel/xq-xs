{@type:filter|@guid:e9c5ab5dd7a6447fa1ac7c639fb0b2e7}
setbarfreq("W");

input:XLength(10,"區間1");
input:XLength1(60,"區間2");
input:XLength2(120,"區間3");
input:Length1(0,"區間1大於幾周");
input:Length2(5,"小於幾周");
input:Length3(0,"區間2大於幾周");
input:Length4(5,"小於幾周");
input:Length5(0,"區間3大於幾周");
input:Length6(5,"小於幾周");
input:Length7(3,"最大量大於幾周");
input:Length8(120,"小於幾周");
input:Length9(0,"最低價大於幾周");
input:Length10(90,"小於幾周");
input:Xfactor1(1,"高點高於低點幾倍");
input:Xfactor2(2,"高點低於低點幾倍");
input:Xfactor3(1.3,"區間1高點高於低點幾倍");
input:Xfactor4(2,"區間2高點低於低點幾倍");
input:percent1(0,"大於高減低點幾%");
input:percent2(100,"小於高減低點幾%");

SettotalBar(XLength2);

value1=FastHighestBar(high,XLength);
value2=FastHighestBar(high,XLength1);
value3=FastHighestBar(high,XLength2);
value4=FastHighest(high,XLength);
value5=FastHighest(high,XLength1);
value6=FastHighest(high,XLength2);
value7=FastHighestbar(volume,XLength2);
value8=Fastlowest(low,XLength2);
value9=Fastlowestbar(low,XLength2);
Value11=fasthighest(h, Xlength2);
Value12=fastlowest(l,Xlength2);
value13=FastHighest(high,XLength);
value14=Fastlowest(low,XLength);



if value1<= length2 and value1>= length1 
and value2<= length4 and value2>= length3
and value3<= length6 and value3>= length5
and value7<= length8 and value7>= length7
and value9<= length10 and value9>= length9
and value6>=value8*Xfactor1
and value6<=value8*Xfactor2
and value13>=value14*Xfactor3
and value13<=value14*Xfactor4
and C>=(value12+(value11-value12)*0.01*percent1)
and C<=(value12+(value11-value12)*0.01*percent2)


then
ret = 1;
