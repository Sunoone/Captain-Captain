/// @description scr_interface_get_type( interface_index, x, y  )
/// @param interface_index
/// @param x
/// @param y

// this script returns the type of under the x and y in the given interface
// x and y arguments hould be passed relative to the interface screen

var int, dist, type;

int = global.owned_interface[ argument0 ];

dist = point_distance( int.s_width, int.s_height, argument1, argument2 );
dist -= int.rad_0;

if( dist > 0 ) return -1;

type = max_rings - abs( floor( dist / r_dist ) );

if( type >= int.max_rings ) return -1;

return type;