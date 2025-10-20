{@type:filter|@guid:6fb9ff5be7b643b6866104a1e4b7ddc3}
SetBarFreq("D");
input:Leng1(20,"幾日線");
input:percent(5,"小於幾Percent");
variable: ma1(0);


ma1 = average(c, Leng1);


condition1 = absvalue(c-ma1)<C*percent*0.01;

if condition1 then
ret = 1;

SetOutputName1("日線");   
OutputField1(ma1);
SetOutputName2("小於幾Percent");   
OutputField2(percent);













