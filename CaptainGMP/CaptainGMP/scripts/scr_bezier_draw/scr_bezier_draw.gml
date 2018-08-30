/// @description scr_bezier_draw( x, y, BezierCurve, interpolation, color0, color1, alpha )

/// @param x
/// @param y
/// @param BezierCurve
/// @param interpolation
/// @param color0
/// @param color1
/// @param alpha

// this script draws a Bézier curve to the given x and y with the curve as offset

// interpolation is the amount of polygons that the curve will be drawn in

// color0 is the inside color
// color1 is the outside (curve) color

draw_primitive_begin( pr_trianglelist );

var p0, p1;
p0 = scr_bezier_calculate_point( argument2, 0 );

for( var i = 0; i < argument3; i++ )
{
	p1 = scr_bezier_calculate_point( argument2, (i + 1) / argument3 );
	
	draw_vertex_color(argument0,argument1,argument4,argument6);
	draw_vertex_color(argument0+p0[0],argument1+p0[1],argument5,argument6);
	draw_vertex_color(argument0+p1[0],argument1+p1[1],argument5,argument6);
	
	p0 = p1;
}

draw_primitive_end();
