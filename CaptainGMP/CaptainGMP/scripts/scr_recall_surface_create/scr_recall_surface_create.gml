/// @description scr_recall_surface_create( width, height )

/// @param width
/// @param height

// This script creates a recall surface and returns the id

if( !variable_global_exists( global.recall_surface ) )
	global.recall_surface = ds_grid_create(1,5);
	
var rs_id, i;

rs_id = get_timer();
i = scr_ds_grid_add_column(global.recall_surface);

/*
	// ds grid index
	0 = id
	1 = surface
	2 = 2d array
	3 = width
	4 = height
*/

global.recall_surface[# i,0] = rs_id;
global.recall_surface[# i,1] = surface_create( argument0, argument1 );
global.recall_surface[# i,2] = ds_grid_create( 1, 15 );
global.recall_surface[# i,3] = argument0;
global.recall_surface[# i,4] = argument1;

/*
	// ds_grid content
	 0 = id
	 1 = x
	 2 = y
	 3 = rotation
	 4 = scale x
	 5 = scale y
	 6 = color
	 7 = alpha
	 8 = shader
	 9 = priority
	10 = type
	12 = sprite channel 0
	13 = sprite channel 1*
	14 = sprite channel 2*
	15 = sprite channel 3*
*/

return rs_id;