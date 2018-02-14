/// @description scr_interface_get_pos( interface_index, x, y )
/// @param interface_index
/// @param x
/// @param y

// this script returns the pos of under the x and y in the given interface
// x and y arguments hould be passed relative to the interface screen

var int, type, dir, pos;

int = global.owned_interface[ argument0 ];
type = scr_interface_get_type( argument0, argument1, argument2 );

if( type < 0 ) return -1;

dir = point_direction( int.s_width, int.s_height, argument1, argument2 );

pos = dir / int.grid_spacing;
pos = floor( pos + 0.5 );

if( pos >= int.grid_width ) pos = 0;

return pos;