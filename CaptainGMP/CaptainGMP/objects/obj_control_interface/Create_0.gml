/// @description Ini vars

// This objects projects the control circle for ship objects

list_count = 0;
r_dist = 65;

	//interface
select_id = -4;
select_ring = -4;
select_pos = -4;

clear = false;
clear_id = -4;

update = false;

	//debug
//debug_size = 0;

	// Database for node storage
		// This database needs to hold all interface elements for components, controlers and software
		// This database needs to hold the position of those elements
		// This database needs to hold the links between elements


ring[0,0] = 0;

	// ring index
g_type = 0;		// what type does this space holds?
g_free = 1;		// can this space be used?
g_parent = 2;	// what is this space it's parent, if any?
e_id = 3;		// list element id
e_rot = 4;		// list element rotation
e_spr = 5;		// list element sprite
e_link = 6;		// list element link
e_x = 7;		// list element x
e_y = 8;		// list element y
e_width = 9;	// list element width

grid_width = 24;
grid_height = 10;
max_rings = 3;

for( var i = 0; i<max_rings; i++)
{
	ring[i,0] = ds_grid_create( grid_width, grid_height );
	ds_grid_set_region( ring[i,0], 0, 0, grid_width -1, grid_height -1, -4 );
	ds_grid_set_region( ring[i,0], 0, g_free, grid_width -1, g_free, true );
}




