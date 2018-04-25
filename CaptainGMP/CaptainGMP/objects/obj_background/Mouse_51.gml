/// @description debug options

if( debug_enabled )
{
	if( mouse_x > d_x1 + 10 &&  mouse_x < d_x1 + 90 && mouse_y > d_y1 + 10 &&  mouse_y < d_y1 + 90 )	
	{
		light_direction[0] = (mouse_x - d_x1 - 10) / 80;
		light_direction[1] = (mouse_y - d_y1 - 10) / 80;
		light_direction[2] = 1.0 - max( light_direction[0], light_direction[1] ) * 0.5;
	}
	
	if( mouse_x > d_x1 - 40 &&  mouse_x < d_x1 - 10 && mouse_y > d_y1 &&  mouse_y < d_y2 )	
	{
		d_kelvin = ((mouse_y - d_y1) / 100) * 4000 + 4000;
		light_colour = scr_kelvin2rgb( d_kelvin );
	}
	
}

