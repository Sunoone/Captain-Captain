/// @description Clean vars

// deregister with the interface
var int = global.owned_interface[ owner ];

if instance_exists( int )
{
	var grid, i, x2;
	grid = int.ring[0,0];
	x2 = ds_grid_width(grid);

	i = ds_grid_value_exists( grid, 0, e_id, x2, e_id, id );
	if( i == true )
	{
		var pos = ds_grid_value_x( grid, 0, e_id, x2, e_id, id );
		scr_interface_remove( owner, 0, pos );	
	}
}

if( instance_exists(core) )
{
	scr_ds_list_remove_value( core.software, id );
}

ds_list_destroy(children);
ds_list_destroy(allowed_type);