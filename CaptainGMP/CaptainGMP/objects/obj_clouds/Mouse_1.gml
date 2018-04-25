/// @description debug options

if( debug_enabled )
{
	var s_off_x, s_off_y;
	
	s_off_x = 0;
	s_off_y = 0;
	
	if( screen_index != -4 )
	{
		s_off_x = scr_screen_surface_get_x( screen_index );
		s_off_y = scr_screen_surface_get_y( screen_index );
	}
	
	if( mouse_x > d_x1 + 10 - s_off_x &&  mouse_x < d_x1 + 90 - s_off_x && mouse_y > d_y1 + 10 - s_off_y &&  mouse_y < d_y1 + 90 - s_off_y )	
	{
		light_direction[0] = (mouse_x - d_x1 - 10 - s_off_x ) / 80;
		light_direction[1] = (mouse_y - d_y1 - 10 - s_off_y) / 80;
		light_direction[2] = 1.0 - max( light_direction[0], light_direction[1] ) * 0.5;
	}
	
	if( mouse_x > d_x1 - 40 - s_off_x &&  mouse_x < d_x1 - 10 - s_off_x && mouse_y > d_y1 - s_off_y &&  mouse_y < d_y2 - s_off_y )	
	{
		d_kelvin = ((mouse_y - d_y1 - s_off_y) / 100) * 4000 + 4000;
		light_colour = scr_kelvin2rgb( d_kelvin );
	}
	
}

