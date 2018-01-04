/// @description Ini vars

// This objects projects the control circle for ship objects

list_count = 0;
r_dist = 65;

	//interface
//select_id = -4;
//select_ring = -4;
//select_pos = -4;

drag_id = -4;
drag_ring = -4;
drag_pos = -4;
drag_hold = false;

drag_old_x = -4;
drag_old_y = -4;
drag_off_x = -4;
drag_off_y = -4;

//clear = false;
//clear_id = -4;

update = false;

	//debug
//debug_size = 0;

	// Database for node storage
		// This database needs to hold all interface elements for components, controlers and software
		// This database needs to hold the position of those elements
		// This database needs to hold the links between elements


ring[0,0] = 0;

grid_width = 24;
grid_height = 10;
max_rings = 3;

for( var i = 0; i<max_rings; i++)
{
	ring[i,0] = ds_grid_create( grid_width, grid_height );
	ds_grid_set_region( ring[i,0], 0, 0, grid_width -1, grid_height -1, -4 );
	ds_grid_set_region( ring[i,0], 0, g_free, grid_width -1, g_free, true );
}




