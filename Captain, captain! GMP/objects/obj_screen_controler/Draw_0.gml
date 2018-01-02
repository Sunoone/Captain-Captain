/// @description Draw screen surfaces

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

