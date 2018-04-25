/// @description move clouds & debug


background_x += c_move[0] * ( delta_time*0.000001 );
background_y += c_move[1] * ( delta_time*0.000001 );




if( debug_enabled && surface_exists( background ) )
{
	surface_set_target( background );
	
	// draw_rectangle_color( 0,0, b_width, debug_height, c_black, c_black, c_black, c_black, false );
	
		// Light direction
	var a, l_x, l_y;
	
	l_x = d_x1 + 10 + 80 * light_direction[0];
	l_y = d_y1 + 10 + 80 * light_direction[1];
	a = 0.7;
	
	draw_primitive_begin( pr_trianglestrip );
	
	draw_vertex_color( d_x1,d_y1, d_col2, a );
	draw_vertex_color( d_x1,d_y2, d_col2, a );
	draw_vertex_color( d_x2,d_y1, d_col2, a );
	draw_vertex_color( d_x2,d_y2, d_col2, a );
	
	draw_primitive_end();
	
	draw_rectangle_color( d_x1,d_y1,d_x2,d_y2, d_col1, d_col1, d_col1, d_col1, true );
	draw_circle_color( l_x, l_y, 8, d_col1, d_col1, true );
	
		// Light temperature
	draw_rectangle_color( d_x1 - 10, d_y1, d_x1 - 40, d_y2, d_col3, d_col3, d_col4, d_col4, false );
	draw_rectangle_color( d_x1 - 10, d_y1, d_x1 - 40, d_y2, d_col1, d_col1, d_col1, d_col1, true );
	
	var l_h = ((d_kelvin - 4000) / 40 );
	
	draw_line_color( d_x1 - 45, d_y1 + l_h, d_x1 - 5, d_y1 + l_h,  d_col2, d_col2 );
	
	surface_reset_target();
}
	