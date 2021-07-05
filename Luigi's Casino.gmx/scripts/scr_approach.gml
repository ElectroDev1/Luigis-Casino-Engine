var Value=argument0;
var Destination=argument1;
var Speed=argument2;

if(Value>Destination){Value-=Speed;}
if(Value<Destination){Value+=Speed;}

return Value;
