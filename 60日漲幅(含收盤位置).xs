{@type:filter|@guid:2568ff0f74dc40ffa06327b7f1adb12d}
setbarfreq("D");  


input:percent1(0,"變動大於幾趴");   
input:percent2(5,"變動小於幾趴");  
input:period(60,"幾日內");          
input:percent3(80,"大於高減低點幾%");
input:percent4(120,"小於高減低點幾%");


settotalbar(period+1);


Value1=fasthighest(h[1], period); 
Value2=fastlowest(l[1],period);   


if (c - c[period-1]) >= c[period-1] * (percent1 * 0.01)   
   and (c - c[period-1]) <= c[period-1] * (percent2 * 0.01)
   and C>=(value2+(value1-value2)*0.01*percent3)
  and C<=(value2+(value1-value2)*0.01*percent4)
then 
   ret = 1;  


