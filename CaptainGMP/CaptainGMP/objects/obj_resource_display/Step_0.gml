/// @description Update CPU counter

CPU_surface = scr_screen_surface_get_id( CPU_screen_index );

if( surface_exists(CPU_surface) && CPU_max > 0 )
{
	surface_set_target( CPU_surface );
		
		// draw cpu bar
	var h_b = CPU_surface_height * ( ( CPU_max - CPU_use ) / CPU_max ); // the height of the CPU bar
	draw_rectangle_colour( 0, CPU_surface_height - h_b, CPU_surface_width, CPU_surface_height, CPU_col, CPU_col, CPU_col, CPU_col, false );
	
		// draw cpu cost
	if( CPU_cost != 0)
	{
		
			// set the right colour
		if( CPU_max - ( CPU_cost + CPU_use ) < 0 )
			CPU_col_cost = make_color_rgb( 202, 0, 5 );
		else if( CPU_cost > 0 )
			CPU_col_cost = c_purple;
		else
			CPU_col_cost = CPU_col_gain;
		
		var h_u = CPU_surface_height * ( CPU_cost / CPU_max ); // the height of the cost display
		var u_y =  CPU_surface_height - h_b; // the y of the use bar
		
		draw_rectangle_colour( 0, u_y, CPU_surface_width, u_y + h_u, CPU_col_cost, CPU_col_cost, CPU_col_cost, CPU_col_cost, false );
	}
	
	
	surface_reset_target();
}

CPU_max = 0;	// this is the maximum amount of CPU availiable
CPU_cost = 0;	// this variable lights up a part of the CPU bar to display cost
CPU_use = 0;	// this is the amount of CPU in use