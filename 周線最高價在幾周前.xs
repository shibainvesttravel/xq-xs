{@type:filter|@guid:d9069832506645fa881dafeb799185c5}
setbarfreq("W");
input:XLength(60,"長期計算期數");
input:Length1(0,"大於幾周");
input:Length2(20,"小於幾周");


settotalbar(XLength);

value1=FastHighestBar(h,XLength);


if value1<= length2 and value1>= length1 then
ret = 1;
