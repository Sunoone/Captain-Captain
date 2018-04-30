/// @description scr_camera_draw_sprite( camera, sprite, subimage, center_x, center_y, rot )
/// @param camera
/// @param sprite
/// @param subimage
/// @param x
/// @param y
/// @param rot

// this script is used to draw sprites to the camera view

var c, c_rot, sw, sh, sl, xm, ym, lm, nr, xr, yr, rot, scale;
	
c = argument0;
	
scale = 1/c.scale;
c_rot = c.rot;
	
surface_set_target( scr_screen_surface_get_id( c.screen_index ) );
	
	// rotate world cordinates
lm = point_distance( c.x, c.y, argument3, argument4 );
nr = point_direction( c.x, c.y, argument3, argument4 ) - c_rot;
	
xr = c.x + lengthdir_x( lm, nr );
yr = c.y + lengthdir_y( lm, nr );
	
	// scale world to screen space co-ordinates
xm = (xr - c.x1) * scale;
ym = (yr - c.y1) * scale;

draw_sprite_ext( argument1, argument2, xm, ym, scale, scale, argument5 - c_rot, c_white, 1 );

surface_reset_target();