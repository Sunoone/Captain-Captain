/// @description Clean vars
// If overwritten, do not forget to copy this code
	// Try not to overwrite tis code

// deregister with the interface
var int = global.owned_interface[ original_owner ];
if(instance_exists( int ) )
{
	if( type > 0 && type < int.max_rings )
	{
		var grid, i, x2;
		grid = int.ring[type,0];
		x2 = ds_grid_width(grid);

		i = ds_grid_value_exists( grid, 0, e_id, x2, e_id, id );
		if( i == true )
		{
			var pos = ds_grid_value_x( grid, 0, e_id, x2, e_id, id );
			scr_interface_remove( original_owner, type, pos );	
		}
	}
}

if( instance_exists( parent ) && type != 0 ) 
{
		// destroy self out off the ship grid
	scr_3d_array_set( parent.ship_grid, grid_x, grid_y, ship_object, -1 );
	parent.draw_grid_object_recheck = true;	
}


// destroy ds_lists
ds_list_destroy(children);
ds_list_destroy(owned_childern);
ds_list_destroy(allowed_type);

ds_list_destroy(hacking_owner);
ds_list_destroy(hacking_level);
ds_list_destroy(hacking_progress);

ds_list_destroy(interface_name_list);
ds_list_destroy(interface_number_list);