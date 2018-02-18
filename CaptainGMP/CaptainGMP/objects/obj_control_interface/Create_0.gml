/// @description Ini vars

// This objects projects the control circle for ship objects
list_count = 0;
r_dist = 65;

	//interface
drag_id = -4;
drag_ring = -4;
drag_pos = -4;
drag_hold = false;
drag_slot = -4;

drag_sprite = -1;

drag_inventory = false;

select_id = -4;
select_pos = -1;
select_type = -1;

update = false;

access = 0; // this variable controls if the player has friendly or hostile access to this interface

	//debug
//debug_size = 0;

	// Database for node storage
		// This database needs to hold all interface elements for components, controlers and software
		// This database needs to hold the position of those elements
		// This database needs to hold the links between elements


ring[0,0] = 0;

grid_width = 24;
grid_height = 10;
grid_spacing = 360 / grid_width;
max_rings = 3;

for( var i = 0; i<max_rings; i++)
{
	ring[i,0] = ds_grid_create( grid_width, grid_height );
	ds_grid_set_region( ring[i,0], 0, 0, grid_width -1, grid_height -1, -4 );
	ds_grid_set_region( ring[i,0], 0, g_free, grid_width -1, g_free, true );
	
	ds_grid_set_region( ring[i,0], 0, e_visible, grid_width -1, e_visible, -1 );
}

ds_grid_set_region( ring[2,0], 0, e_visible, grid_width -1, e_visible, 0 ); // set components to obscured

// inventory -> create when switching access @ Begin Step
inventory_index = -4;
inventory_width = 60;
inventory_slots = 9;
inventory = ds_grid_create( inventory_slots, grid_height );
	ds_grid_set_region( inventory, 0, 0, grid_width -1, grid_height -1, -4 );
	ds_grid_set_region( inventory, 0, g_free, grid_width -1, g_free, true );
	ds_grid_set_region( inventory, 0, e_visible, grid_width -1, e_visible, 1 );