{@type:filter|@guid:f24d6a4ceefb46168aa8005884020563}
setbarfreq("W");
input:XLength(240,"計算期數"); 
input:percent1(10,"大於高減低點幾%");
input:percent2(85,"小於高減低點幾%");
input:percent3(30,"區間漲幅大於幾%");
input:percent4(100,"區間漲幅小於幾%");


settotalBar(XLength);


Value1=fasthighest(h[1], Xlength); 
Value2=fastlowest(l[1],Xlength);   


if  C>=(value2+(value1-value2)*0.01*percent1)
  and C<=(value2+(value1-value2)*0.01*percent2)
  and value1>=value2*(1+percent3*0.01)
  and value1<=value2*(1+percent4*0.01)
 then
ret = 1;
