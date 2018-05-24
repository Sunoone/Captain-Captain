/// @description Clean

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

// destroy ds_lists
ds_list_destroy(children);
ds_list_destroy(owned_childern);
ds_list_destroy(allowed_type);

ds_list_destroy(interface_name_list);
ds_list_destroy(interface_number_list);

// Inherit the parent event
event_inherited();

