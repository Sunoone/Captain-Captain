/// @description scr_point_rotate( rot_x, rot_y, degrees )

/// @param rot_x
/// @param rot_y
/// @param degrees

// this script rotates (0,0) around the given co_ordinates and returns the co-ordinates in vec2

var l_l,l_d;
l_l = pyt( argument0, argument1 );
l_d = argument2 - point_direction( 0,0,argument0,argument1 );

return vec2( lengthdir_x( l_l, l_d ), lengthdir_y( l_l, l_d ) );
