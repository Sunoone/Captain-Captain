/// @description mix( value1, value2, mix )

/// @param value1
/// @param value2
/// @param mix

// this function returns the mix of the two variable based on the given mix argument
// mix = 0, value1 = 100%, value2 = 0%
// mix = 1, value1 = 0%, value2 = 100%

var m = clamp( argument2, 0, 1 );

return( argument0 * (1-m) + argument1 * m );