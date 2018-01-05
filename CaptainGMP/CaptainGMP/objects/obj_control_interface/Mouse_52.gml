/// @description Drag element

// drag an interface element across the screen

if(drag_hold)
{
	var m_x, m_y, grid;
	grid = ring[drag_ring,0];
	
	if( scr_screen_mouse_above( screen_index ) )
	{
		m_x = scr_screen_mouse_get_x( screen_index );
		m_y = scr_screen_mouse_get_y( screen_index );
		
		grid[# drag_pos, e_x] = m_x; // + drag_off_x
		grid[# drag_pos, e_y] = m_y; // + drag_off_y
	}
	else 
	{
		drag_hold = false;
		grid[# drag_pos, e_x] = drag_old_x;
		grid[# drag_pos, e_y] = drag_old_y;
	}
}
