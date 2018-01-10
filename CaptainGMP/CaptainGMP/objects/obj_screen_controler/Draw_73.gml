/// @description Draw & Clear screen surfaces

// Draw contained apropriate screen surfaces here
var h = array_height_2d(screen_surface);

for( var i = 0; i<h; i++ )
{
	if( screen_surface[i,0] == true ) // is the surface active?
	{
		if( surface_exists( screen_surface[i,1] ) == true )	
		{
			// Draw the surface
			draw_surface( screen_surface[i,1], screen_surface[i,4], screen_surface[i,5] );
		}
		else
		{
			// Recreate the surface
			surface_create( screen_surface[i,2], screen_surface[i,3] );	
		}
	}
}

// this event clears all active surfaces
var h = array_height_2d(screen_surface);

for( var i = 0; i<h; i++ )
{
	if( screen_surface[i,0] == true ) // is the surface active?
	{
		if( surface_exists( screen_surface[i,1] ) == true )	// does the surface exists?
		{
			// clear the surface
			surface_set_target( screen_surface[i,1] )
			draw_clear_alpha(c_black,0);
			
			//debug
			draw_rectangle_color( 1, 1, surface_get_width(screen_surface[i,1])-2, surface_get_height(screen_surface[i,1])-2, c_red,c_red,c_red,c_red, true );
			
			surface_reset_target();
		}
	}
}