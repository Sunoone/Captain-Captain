/// @description mix( value1, value2, mix )

/// @param value1
/// @param value2
/// @param mix

// this function returns the mix of the two variable based on the given mix argument
// mix = 0, value1 = 100%, value2 = 0%
// mix = 1, value1 = 0%, value2 = 100%

var m = clamp( argument2, 0, 1 );

var a1 = argument0 * (1-m);
var a2 =  argument1 * m;

return( a1 + a2 );