/// @description Update CPU counter

CPU_surface = scr_screen_surface_get_id( CPU_screen_index );

if( surface_exists(CPU_surface) && CPU_max > 0 )
{
	surface_set_target( CPU_surface );
	
		// draw cpu bar
	var h_b = CPU_surface_height * ( ( CPU_max - CPU_use ) / CPU_max ); // the height of the CPU bar
	draw_rectangle_colour( CPU_surface_height - h_b, 0, CPU_surface_height, 30, CPU_col, CPU_col, CPU_col, CPU_col, false );
	
		// draw cpu cost
	if( CPU_cost > 0 )
	{
		
			// set the right colour
		if( CPU_max - ( CPU_cost + CPU_use ) < 0 )
			CPU_col_use = make_color_rgb( 202, 0, 5 );
		else
			CPU_col_use = c_purple;
		
		var h_u = CPU_surface_height * ( CPU_cost / CPU_max ); // the height of the cost display
		var u_y =  CPU_surface_height - h_b; // the y of the use bar
		
		draw_rectangle_colour( u_y, 0, u_y + h_u, 30, CPU_col_use, CPU_col_use, CPU_col_use, CPU_col_use, false );
	}
	
	
	surface_reset_target();
}