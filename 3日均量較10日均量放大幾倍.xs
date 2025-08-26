{@type:filter|@guid:224eb1c3e6b84d859b2adbe29f40870c}
setbarfreq("D");
input: Length1(3,"均量區間1");
input: Length2(10,"均量區間2");
input: VolFactor(2,"比例");

SettotalBar(Length2);

Ret =  Average(Volume, Length1)>  Average(Volume, Length2)* VolFactor;
