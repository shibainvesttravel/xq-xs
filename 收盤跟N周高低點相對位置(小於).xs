{@type:filter|@guid:41e57fa6ef1e4972afb20370442cbcde}
setbarfreq("W");
input:XLength(240,"計算期數");
input:percent1(85,"小於高減低點幾%");

settotalBar(XLength);

variable: PriceHighBar(0),Pricelowbar(0),VolumeHighBar(0);

VolumeHighBar = fasthighestbar(volume, XLength);
PriceHighBar = fasthighestbar(high,XLength);
PriceLowBar = fastlowestbar(low,XLength);

Value1=fasthighest(h[1], Xlength);
Value2=fastlowest(l[1],Xlength);

if  C<(value2+(value1-value2)*0.01*percent1)
 then
ret = 1;
