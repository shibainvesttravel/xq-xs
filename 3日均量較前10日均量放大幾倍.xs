{@type:filter|@guid:983c8612e31b43fead265ae8e8e91868}
setbarfreq("D");
input: Length1(3,"均量區間1");
input: Length2(10,"均量區間2");
input: VolFactor(2,"比例");

SettotalBar(Length2);

Ret =  Average(Volume, Length1)>  Average(Volume[length1], Length2)* VolFactor;
