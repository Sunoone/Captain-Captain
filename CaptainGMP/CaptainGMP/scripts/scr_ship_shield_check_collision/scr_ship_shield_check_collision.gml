/// @description scr_ship_shield_check_collision( ship_id, p_x, p_y, p_radius )

/// @param ship_id
/// @param p_x
/// @param p_y
/// @param p_radius

	// Does the ship exist?
if( !instance_exists(argument0) ) return -1;

var p_x, p_y;

p_x = argument0.x - argument1;
p_y = argument0.y - argument2;

	// Is the projectile within the ship's collision radius?
if( point_distance( 0,0,p_x,p_y ) - argument3 > argument0.collision_radius )
	return 0;

	// rotate collition point in relation to normal ship co-ordinates
var dir = (point_direction( 0,0,p_x,p_y ) - argument0.direction) mod 360;
if( dir < 0 ) dir += 360;

var len = point_distance( 0,0,p_x,p_y );
p_x = lengthdir_x( len, dir );
p_y = lengthdir_y( len, dir );

	// Check collision on ship bezier curves
var c = -1;

for( var i = 0; i < array_length_1d( argument0.SHAPE ); i++ )
{
	c = scr_bezier_collision_point( p_x, p_y, argument0.SHAPE[i], argument3 );
	
	if( c >= 0 ) 
		return c;
}

return c;