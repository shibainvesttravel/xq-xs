{@type:filter|@guid:92d88cc240184d12bcca63605069d91e}
setbarfreq("D");
input:XLength(120,"計算期數");
input:Length1(20,"大於幾日");
input:Length2(70,"小於幾日");
input:percent1(20,"漲幅小於");
input:percent2(0,"漲幅大於");
input:percent3(20,"K棒長度小於");
input:percent4(5,"K棒長度大於");

settotalBar(XLength);


value1=FastHighestBar(high,XLength);

Value11=H[value1];
Value12=L[value1];
Value13=C[value1];
Value14=O[value1];
Value15=H[value1+1];
Value16=C[value1+1];



if value1<= length2 and value1>= length1 
and value11<value12*(1+percent3*0.01)
and value11>value12*(1+percent4*0.01)
and value13<value16*(1+percent1*0.01)
and value13>value16*(1+percent2*0.01)
then
ret = 1;

