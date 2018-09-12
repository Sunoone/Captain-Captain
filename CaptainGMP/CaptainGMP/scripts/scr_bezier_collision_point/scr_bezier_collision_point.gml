/// @description scr_bezier_collision_point( p_x, p_y, bezier, radius )

/// @param p_x
/// @param p_y
/// @param bezier
/// @param radius

// this script returns a number between 0.0 and 1.0 based on if a part or the whole of the collision circle lays within the given Bezier curve

var dir, bp0, bp1, bd0, bd1;

dir = point_direction( 0,0,argument0,argument1 );

bp0 = scr_bezier_calculate_point( argument2, 0 );
bp1 = scr_bezier_calculate_point( argument2, 1 );

bd0 = point_direction( 0,0, bp0[0], bp0[1] );
bd1 = point_direction( 0,0, bp1[0], bp1[1] );

var ang, apr;

ang = scr_angle_difference( bd0, bd1 );
apr = scr_angle_difference( bd0, dir );

//if( ang == 0 ) // invalid curve
	//return -1;

	// Check if the point falls between the two angles
if( abs( ang ) != abs( apr ) + abs( scr_angle_difference( dir, bd1 ) ) )
	return -1;

	// Approach collision point (wrong)
var t = abs( apr / ang );
var p, a;
for( var i = 1; i < 5; i++ )
{
	p = scr_bezier_calculate_point( argument2, t );
	a = point_direction( 0,0, p[0], p[1] );
	
	t += (scr_angle_difference( a, dir ) / 180) / i;
}

	// calculate difrence
var m_l, c_l;

m_l = point_distance( 0,0, p[0], p[1] );
c_l = point_distance( 0,0, argument0,argument1 );

if( c_l <= m_l )
	return 1.0;
	
if( c_l - m_l < argument3 )
	return( 1.0 - ( (c_l - m_l) / argument3 ) );

return 0.0;
