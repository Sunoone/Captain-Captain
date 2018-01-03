/// @description Ini vars

// This objects projects the control circle for ship objects
list_count = 0;

	// Get a private screen from the screen controler
//screen_index = scr_screen_surface_create( round(room_width / 3), round(room_height / 2), 0, round(room_height / 2), true );
//screen_id = scr_screen_surface_get_id( screen_index );

	// graphics
//f_width = surface_get_width(screen_id);
//f_height = surface_get_height(screen_id);
//f_x = scr_screen_surface_get_x(screen_index);
//f_y = scr_screen_surface_get_y(screen_index);
//s_width = round( 0.5 * f_width );
//s_height = round( 0.5 * f_height );
//rad_0 = min(s_width,s_height) - 5;
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
max_rings = 3;
grid_width = 3;

ring[0,0] = 0;

for( var i = 0; i<max_rings; i++)
{
	//ring[i,0] = ds_list_create(); // the list
	ring[i,0] = 8*(i+1); //max interface elements
	
	ring[i,1] = ds_list_create(); // interface_element reference
	ring[i,2] = ds_list_create(); // element rotation
	ring[i,3] = ds_list_create(); // element object type
	ring[i,4] = ds_list_create(); // element object sprite
	ring[i,5] = ds_list_create(); // element link id
	ring[i,6] = ds_list_create(); // element x
	ring[i,7] = ds_list_create(); // element y
	ring[i,8] = ds_list_create(); // element link x
	ring[i,9] = ds_list_create(); // element link y
}
