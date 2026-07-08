{@type:filter|@guid:fd6684927ab3496b83736c160069da03}
SetBarFreq("W");
input: shortlength(120,"幾周均線");
input: period1(10,"幾周內");
input: period2(5,"幾周內");
input: decline1(1,"下降幅度");

variable: shortaverage(0);
settotalBar(60);

value1 = average(c,shortlength);
value2 = countif(c<value1,period2);

condition1=value1<value1[period1]*(1-decline1*0.01);
condition2=value2>=round(period2/2,0);

	
	if condition1 and condition2
	then  
	ret=1;
  
