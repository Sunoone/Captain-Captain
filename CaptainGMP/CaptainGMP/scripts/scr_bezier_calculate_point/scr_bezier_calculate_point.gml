/// @description scr_bezier_calculate_point( BezierCurve, t )

/// @param BezierCurve
/// @param t

// this function returns a point (vec2) on a (cubic) bezier curve based on t
// t is a float ranging from 0.0 to 1.0

var P0, P1, P2, P3;

P0 = vector_create( argument0[0], argument0[1] );
P1 = vector_create( argument0[2], argument0[3] );
P2 = vector_create( argument0[4], argument0[5] );
P3 = vector_create( argument0[6], argument0[7] );

var v, t;

t = clamp( argument1, 0, 1 );

for( var i = 0; i < 2; i++ )
{
	v[i] =	P0[i] * power( 1 - t, 3 ) + 
			P1[i] * 3 * power( 1 - t, 2 ) * t +
			P2[i] * 3 * ( 1 - t ) * power( t, 2 ) +
			P3[i] * power( t, 3 );			
}

return v;
