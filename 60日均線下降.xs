{@type:filter|@guid:66ebbc970cda49338273fc6b71544ea6}
SetBarFreq("D");
input:Leng1(60,"均線");
input:percent1(2,"percent");

SettotalBar(60);

Value1 = average(c, Leng1);

condition1=value1<value1[5];
condition2=value1<value1[10]*(1-percent1*0.01);

if condition1 or condition2
then 
ret = 1;

