/// @description Stop Drag


if(drag_hold && instance_exists( drag_id ) )
{
	var grid;
	grid = ring[drag_ring,0];
	
	// look for ring space
	var m_x, m_y, grid, type, pos;
	m_x = scr_screen_mouse_get_x( screen_index );
	m_y = scr_screen_mouse_get_y( screen_index );
		
	grid = ring[ drag_ring, 0];
		
	type = scr_interface_get_type( index, m_x, m_y );
	pos = ( scr_interface_get_pos( index, m_x, m_y ) - floor( -0.5 + 0.5 * drag_id.interface_width ) ) mod grid_width;
	while(pos < 0) pos += grid_width;
	
	if( type == drag_ring && scr_interface_check( index, drag_id, type, pos, drag_pos ) )
	{
		scr_interface_remove( index, drag_ring, drag_pos );
		scr_interface_add( index, drag_id, type, pos );
	}
	else
	{
		// invalid type, return element to original location
		grid[# drag_pos, e_x] = drag_old_x;
		grid[# drag_pos, e_y] = drag_old_y;
	}
}

drag_hold = false;
		
drag_id = -4;
drag_ring = -4;
drag_pos = -4;
