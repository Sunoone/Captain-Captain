/// @description scr_min_angle( angle1, angle2 );
/// @param angle1
/// @param angle2

// This script returns the minium angle between the first and second angle
// the angles should be in degrees

var a1, a2, d1, d2;

a1 = argument0 mod 360;
a2 = argument1 mod 360;

d1 = a2 - a1;
d2 = 360 - abs( d1 );
if( d1 > 0 ) d2 *= -1;

if( abs( d1 ) < abs( d2 ) ) return d1;

return d2;