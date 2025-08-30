{@type:filter|@guid:b3a09a59e0084444b33d1fad5590d0d6}
setbarfreq("D");
input: Length1(3,"均量區間1");
input: Length2(10,"均量區間2");
input: VolFactor(2,"比例");

SettotalBar(Length2);

Ret =  Average(Volume, Length1)<  Average(Volume[length1], Length2)* VolFactor;
