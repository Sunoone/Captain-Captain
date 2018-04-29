/// @description scr_camera_inframe( camera, surface, center_x, center_y, rot )
/// @param camera
/// @param surface
/// @param center_x
/// @param center_y
/// @param rot

// this script returns whether or not any part of the surface lays within the camera space

	// check if the surface is within the camera
var s_width, s_height, s_length, b1, rot, p1,c;

c = argument0;

s_width = surface_get_width(argument1) * 0.5;
s_height = surface_get_height(argument1) * 0.5;

p1[0,0] = s_width; p1[0,1] = -s_height;
p1[1,0] = -s_width; p1[1,1] = -s_height;
p1[2,0] = -s_width; p1[2,1] = s_height;
p1[3,0] = s_width; p1[3,1] = s_height;

s_length = pyt( p1[3,0], p1[3,1] );

for( var i = 0; i<4; i++)
{
	rot = c.rot + argument4 + point_direction( 0,0, p1[i,0], p1[i,1] );
	b1[0] = argument2 + lengthdir_x( s_length, rot );
	
	if( b1[0] >= c.x1 && b1[0] <= c.x2 )
	{
		b1[1] = argument3 + lengthdir_y( s_length, rot );
		
		if( b1[1] >= c.y1 && b1[1] <= c.y2 )
		{
			return true;
		}
	}
}


	// check if any of the edges intersect
var b2;

for( var i = 0; i<4; i++)
{
	rot = argument4 + point_direction( 0,0, p1[i,0], p1[i,1] );
	b2[i,0] = argument2 + lengthdir_x( s_length, rot );
	b2[i,1] = argument3 + lengthdir_y( s_length, rot );
}

return scr_polygon_intersect( argument0.p, b2 );