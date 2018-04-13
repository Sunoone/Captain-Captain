/// @description scr_draw_circulair_coloured_sprite( sprite, subimage, x, y, colour1, colour2, angle_start, percentage )
/// @param sprite
/// @param subimage
/// @param x
/// @param y
/// @param colour1
/// @param colour2
/// @param angle_start
/// @param percentage

// This script draws a colourised sprite in a circle
// it is probably more efficient to draw a sprite using a shader


var h_width, h_height, center_x, center_y, array, colour;

h_width = sprite_get_width( argument0 ) * 0.5;
h_height = sprite_get_height( argument0 ) * 0.5;

center_x = argument2;
center_y = argument3;

array = ds_grid_create( 5, 6 );

array[# 0,0] = center_x + h_width;
array[# 1,0] = center_y - h_height;
array[# 2,0] = point_direction( 0, 0, array[# 0,0], array[# 1,0] );
array[# 3,0] = 1;
array[# 4,0] = 0;

array[# 0,1] = center_x - h_width;
array[# 1,1] = center_y - h_height;
array[# 2,1] = point_direction( 0, 0, array[# 0,1], array[# 1,1] );
array[# 3,1] = 0;
array[# 4,1] = 0;

array[# 0,2] = center_x - h_width;
array[# 1,2] = center_y + h_height;
array[# 2,2] = point_direction( 0, 0, array[# 0,2], array[# 1,2] );
array[# 3,2] = 0;
array[# 4,2] = 1;

array[# 0,3] = center_x + h_width;
array[# 1,3] = center_y + h_height;
array[# 2,3] = point_direction( 0, 0, array[# 0,3], array[# 1,3] );
array[# 3,3] = 1;
array[# 4,3] = 1;


	// calculate points for angles
var ang, c, angle1, angle2, dist, ax, ay, t, u, v;

angle1 = argument6 mod 360;
angle2 = ( angle1 + 3.6 * argument7 ) mod 360;

if( argument7 < 0 )
{
	var a = angle1;
	angle1 = angle2;
	angle2 = a;
}

dist = point_distance( 0, 0, h_width, h_height );

ang = angle1;
c = 4;

repeat(2)
{
	ax = center_x + lengthdir_x( dist, ang );
	ay = center_y + lengthdir_y( dist, ang );
	
		// find the intersect point
	if( ang >= array[# 2,3] || ang < array[# 2,0] )
	{
		u = 3;
		v = 0;
	}
	else for( var i = 0; i < 3; i++ )
	{
		if( ang >= array[# i,2] && ang < array[# i+1,2] )
		{
			u = i;
			v = i + 1;
			break;
		}
	}
	
	t = scr_lines_intersect( array[# 0,u], array[# 1,u], array[# 0,v], array[# 1,v], center_x, center_y, ax, ay, false );
	
	array[# 0,c] = array[# 0,u] + t * ( array[# 0,v] - array[# 0,u] ); // x = x1 + t * (x2 - x1)
	array[# 1,c] = array[# 1,u] + t * ( array[# 1,v] - array[# 1,u] ); // y = y1 + t * (y2 - y1)
	array[# 2,c] = ang;
	array[# 3,c] = array[# 3,u] + t * ( array[# 3,v] - array[# 3,u] ); // x = x1 + t * (x2 - x1)
	array[# 4,c] = array[# 4,u] + t * ( array[# 4,v] - array[# 4,u] ); // y = y1 + t * (y2 - y1)
	
	var x1, y1, u1, v1;
	x1 = array[# 0,c];
	y1 = array[# 1,c];
	u1 = array[# 3,c];
	v1 = array[# 4,c];
	
	
	ang = angle2;
	c++;
}


ds_grid_sort(array, 2, true);

// Draw begin
draw_primitive_begin_texture( pr_trianglelist, sprite_get_texture( argument0, argument1 ) );

var o = 5;

for( var i = 0; i < 6; i++ )
{
	if( array[# 2,i] >= angle1 && array[# 2,i] < angle2 ) 
		colour = argument5;
	else
		colour = argument4;
	
	draw_vertex_texture_color( center_x, center_y, 0.5, 0.5, colour, 1 ); // center
	draw_vertex_texture_color( array[# 0,o], array[# 1,o], array[# 3,o], array[# 4,o], colour, 1 );
	draw_vertex_texture_color( array[# 0,i], array[# 1,i], array[# 3,i], array[# 4,i], colour, 1 );
	
	o = i;
}

draw_primitive_end();



//Debug
draw_point_color( center_x, center_y, c_green );
draw_line_color( array[# 0,5], array[# 1,5], array[# 0,0], array[# 1,0], c_green, c_green );
//draw_line_color( center_x, center_y, array[# 0,5], array[# 1,5], c_green, c_green );
for( var i = 0; i < 5; i++ )
{
	draw_line_color( array[# 0,i], array[# 1,i], array[# 0,1+i], array[# 1,1+i], c_green, c_green );
	
	//draw_line_color( center_x, center_y, array[# 0,i], array[# 1,i], c_green, c_green );
}

ds_grid_destroy(array);
