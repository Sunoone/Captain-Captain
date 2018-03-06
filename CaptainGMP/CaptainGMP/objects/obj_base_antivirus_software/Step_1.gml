/// @description Update Target Lists

if( instance_exists( parent ) )
{	
	// update part count
	devend_part_count = parent.draw_grid_object_index + parent.draw_grid_turret_index;
	
	var ship_core = parent.ship_core;
	if( instance_exists( ship_core ) )
		devend_part_count += ds_list_size( ship_core.software );
	
	// update part registry
	devend_part_reg = ds_list_size( devend_part_list );
	
	// compare part count and registry
	if( devend_part_count != devend_part_reg )
	{
		// re-create part list if necessary		
		scr_ship_get_parts( devend_part_list, parent );	
		
		var ship_core = parent.ship_core;
		if( instance_exists( ship_core ) )
			scr_ds_list_merge( devend_part_list, ship_core.software );
	}
}

// update devend_id list
var size;

size = ds_list_size( devend_id );

for( var i = size-1; i >= 0; i-- )
{
	if( instance_exists( devend_id[|i] ) == false )
		ds_list_delete( devend_id, i );
	else if( devend_id[|i].owner == owner )
		ds_list_delete( devend_id, i );
	else if( devend_id[|i].quarantine )
		ds_list_delete( devend_id, i );
}

// look for new targets
var obj_type;
size = ds_list_size( devend_part_list );
for( var i = 0; i < size; i++ )
{
	if( instance_exists( devend_part_list[|i] ) && devend_part_list[|i] > 0 )
	{
		obj_type = devend_part_list[|i].type;
		if( obj_type >= 0 && obj_type <= 2 && devend_part_list[|i].owner != owner )	
		{
			scr_ds_list_add_unique( devend_id, devend_part_list[|i] );
		}
	}
}