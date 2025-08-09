{@type:filter|@guid:64be4c21121648a794c6600abb0df914}
SetBarFreq("W");
input: shortlength(120,"幾周均線");
input: period1(10,"幾周內");
input: decline1(1,"下降幅度");

variable: shortaverage(0);
settotalBar(60);

value1 = average(c,shortlength);

	
	if value1<value1[period1]*(1-decline1*0.01)
	then  
	ret=1;
  
