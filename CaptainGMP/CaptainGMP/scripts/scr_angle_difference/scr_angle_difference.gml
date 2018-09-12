/// @description scr_angle_difference( angle0, angle1 )

/// @param angle0
/// @param angle1

// This script returns the smalest angle between the two angels, in degrees.

var a, b;

a = argument0;
b = argument1;

while( a < 0 )
	a += 360;
	
while( b < 0 )
	b += 360;
	
a = (a mod 360) - 180;
b = (b mod 360) - 180;

a -= b;

if( a < -180 )
	a += 360;
else if( a > 180 )
	a -= 360;
	
return a;