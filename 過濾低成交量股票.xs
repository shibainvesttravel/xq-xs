{@type:filter|@guid:08da779af2b54f05b6f57c8a75676fd3}
input:Length(5);
input:VolumeLimit(300);
 
SetInputName(1, "均量天期");
SetInputName(2, "最小均量");



Value1 = Average(volume, Length);
Ret = Value1 > VolumeLimit;

SetOutputName1("成交均量");
OutputField1(Value1);