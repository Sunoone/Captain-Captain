/// @description scr_camera_draw_surface( camera, surface_id, center_x, center_y, rot )
/// @param camera
/// @param surface_id
/// @param center_x
/// @param center_y
/// @param rot

// this script is used to draw big things (like ships) to the camera view

// it is probably more efficient to draw all objects vs checking each object with scr_camera_inframe (test this)

if( scr_camera_inframe( argument0, argument1, argument2, argument3, argument4 ) )
{
	var c, c_rot, sw, sh, sl, xm, ym, lm, nr, xr, yr, XX, YY, rot, scale;
	
	c = argument0;
	
	scale = 1/c.scale;
	c_rot = c.rot;
	
	surface_set_target( scr_screen_surface_get_id( c.screen_index ) );
	
		// rotate world cordinates
	lm = point_distance( c.x, c.y, argument2, argument3 );
	nr = point_direction( c.x, c.y, argument2, argument3 ) - c_rot;
	
	xr = c.x + lengthdir_x( lm, nr );
	yr = c.y + lengthdir_y( lm, nr );
	
		// scale world to screen space co-ordinates
	xm = (xr - c.x1) * scale;
	ym = (yr - c.y1) * scale;
	
		// recalculate draw origin point;
	sw = surface_get_width( argument1 ) * 0.5 * scale;
	sh = surface_get_height( argument1 ) * 0.5 * scale;
	
	sl = pyt( sw, sh );
	rot = point_direction( sw,sh,0,0 ) + argument4 - c_rot;	
		
	XX = xm + lengthdir_x( sl, rot );
	YY = ym + lengthdir_y( sl, rot );
	
	draw_surface_ext( argument1, XX, YY, scale, scale, argument4 - c_rot, c_white, 1 );

	surface_reset_target();
}