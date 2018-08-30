/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// destroy all objects on ship_grid
for( var i = 0; i < ship_grid_width; i++ )
{
	for( var j = 0; j < ship_grid_height; j++ )
	{
		var obj = scr_3d_array_get( ship_grid, i, j, ship_object );
		if( instance_exists( obj ) && obj != -1 ) instance_destroy( obj );
	}
}

// destroy the ship_grid 3d array
scr_3d_array_destroy( ship_grid );

// remove the ship from the registry
scr_ds_list_remove_value( global.registry, id );

ds_list_destroy(hackable_parts_list);

// Destroy movement data structues
ds_list_destroy(movement);
ds_list_destroy(rotation);

// destroy surfaces
if( !surface_exists(object_surface) )
	surface_free(object_surface);
	
if( !surface_exists(Shield_surface) )
	surface_free(Shield_surface);
	
if( !surface_exists(Shield_mask_surface) )
	surface_free(Shield_mask_surface);