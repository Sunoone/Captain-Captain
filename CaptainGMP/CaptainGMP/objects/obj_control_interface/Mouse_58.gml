/// @description Stop Drag


if(drag_hold)
{
	var grid;
	grid = ring[drag_ring,0];
	
	if( scr_screen_mouse_above( screen_index ) )
	{
		// look for ring space
		
		
		drag_hold = false;
		grid[# drag_pos, e_x] = drag_old_x;
		grid[# drag_pos, e_y] = drag_old_y;
		
	}
	else 
	{
		//offscreen
		drag_hold = false;
		grid[# drag_pos, e_x] = drag_old_x;
		grid[# drag_pos, e_y] = drag_old_y;
	}
}
