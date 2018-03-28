/// @description scr_interface_draw_indication_lines()

// this script draws drag indication lines when draging an element

if(drag_hold && instance_exists( drag_id ) )
{
	var pos, type, col;
	type = scr_interface_get_type( index, m_x, m_y );
	if( type == drag_ring )
	{		
		pos = (scr_interface_get_pos( index, m_x, m_y ) - floor( -0.5 + 0.5 * drag_id.interface_width ) ) mod grid_width;
		while(pos < 0) pos += grid_width;
		
		col = c_red;
		
		if( scr_interface_check( index, drag_id, drag_ring, pos, drag_pos ) ) 
			col = c_yellow;
		else
		{
			var node = scr_interface_get_node( id, m_x, m_y );
			
			if( instance_exists( node ) && node != -4  && node != drag_id)
			{
				if( node.interface_width == drag_id.interface_width )
				{
					col = c_yellow;
					pos = ds_grid_value_x( ring[ drag_ring, 0 ], 0, e_id, grid_width-1, e_id, node );
				}
			}
		}
		
		var x1, x2, y1, y2, dir;
		
		dir = grid_spacing * (pos - 0.5);
			
		repeat(2)
		{
			x1 = s_width + lengthdir_x(  rad_0 - r_dist * ( max_rings - drag_ring), dir );
			y1 = s_height + lengthdir_y( rad_0 - r_dist * ( max_rings - drag_ring), dir );
			
			x2 = s_width + lengthdir_x(  rad_0, dir );
			y2 = s_height + lengthdir_y( rad_0, dir );
			
			draw_line_color(x1,y1,x2,y2,col,col);
				
			dir = grid_spacing * (pos + 0.5 + drag_id.interface_width - 1);
		}
	}
}