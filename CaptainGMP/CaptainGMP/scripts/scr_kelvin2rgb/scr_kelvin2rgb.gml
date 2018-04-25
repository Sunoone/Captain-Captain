/// @description scr_kelvin2rgb( Kelvin )
/// @param Kelvin

// this script returns an array of rgb values for the given Kelvin white point
// rgb values sit between 0.0 and 1.0

var k = argument0 / 100;

var r,g,b;

// RED
if(k <= 66) r = 255;
else
{
    r = 329.698727446 * power(k - 60, -0.1332047592);
}

// GREEN
if( k <= 66 )
{
    g = 99.4708025861 * ln(k) - 161.1195681661;
}
else
{
    g = 288.1221695283 * power(k - 60, -0.0755148492);
}

// BLUE
if(k >= 66) b = 255;
else if(k <= 19) b = 0;
else
{
    b = 138.5177312231 * ln( k - 10 ) - 305.0447927307;
}

var array;

array[0] = clamp( r/255 ,0.0,1.0);
array[1] = clamp( g/255 ,0.0,1.0);
array[2] = clamp( b/255 ,0.0,1.0);

return array;