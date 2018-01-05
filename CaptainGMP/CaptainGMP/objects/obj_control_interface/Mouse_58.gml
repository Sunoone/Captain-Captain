/// @description Stop Drag


if(drag_hold)
{
	var grid;
	grid = ring[drag_ring,0];
	
	if( scr_screen_mouse_above( screen_index ) )
	{
		// look for ring space
		var m_x, m_y, grid, found;
		m_x = scr_screen_mouse_get_x( screen_index );
		m_y = scr_screen_mouse_get_y( screen_index );
		
		grid = ring[ drag_ring, 0];
		
		found = false;
		
		// equate the mouse position to a position on the interface
		var g_pos_x, g_pos_y, g_pos_r, p_len;
		p_len = (rad_0 * 0.5) - (r_dist * 0.5) + (r_dist * drag_ring);
		
		for( var j = 0; j < grid_width; j++ )
		{
			g_pos_r = ( 360 / grid_width ) * j;
			g_pos_x = s_width + lengthdir_x( p_len, g_pos_r );
			g_pos_y = s_height + lengthdir_y( p_len, g_pos_r );
			
			// if statement has a HARDCODED distance, the radius of an interface element
			if( point_distance( m_x, m_y, g_pos_x, g_pos_y ) <= 50 )
			{
				grid[# drag_pos,e_spr] = spr_target;
				
				if( scr_interface_check( index, drag_id, drag_ring, j, drag_pos ) )
				{
					scr_interface_remove( index, drag_ring, drag_pos );
					scr_interface_add( index, drag_id, drag_ring, j );
					
					//debug
					grid[# drag_pos,e_spr] = spr_ship_1;
					
					found = true;
				}	
				
				break;
			}
		}
		
		if( found == false )
		{
			drag_hold = false;
			grid[# drag_pos, e_x] = drag_old_x;
			grid[# drag_pos, e_y] = drag_old_y;
			
			drag_id = -4;
			drag_ring = -4;
			drag_pos = -4;
		}
	}
	else 
	{
		//offscreen
		drag_hold = false;
		grid[# drag_pos, e_x] = drag_old_x;
		grid[# drag_pos, e_y] = drag_old_y;
		
		drag_id = -4;
		drag_ring = -4;
		drag_pos = -4;
	}
}
else
{
	drag_hold = false;
		
	drag_id = -4;
	drag_ring = -4;
	drag_pos = -4;
}
