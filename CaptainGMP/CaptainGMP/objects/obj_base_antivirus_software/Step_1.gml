/// @description Update Target Lists

if( instance_exists( parent ) )
{
		// create part list
	if( ds_exists( part_list, ds_type_list ) == false )
	{
		part_list = scr_ship_get_parts( parent );	
		
		var ship_core = parent.ship_core;
		if( instance_exists( ship_core ) )
			scr_ds_list_merge( part_list, ship_core.software );
	}
	
	// update part count
	part_count = parent.draw_grid_object_index + parent.draw_grid_turret_index
	
	var ship_core = parent.ship_core;
	if( instance_exists( ship_core ) )
		part_count += ds_list_size( ship_core.software );
	
	// update part registry
	part_reg = ds_list_size( part_count );
	
	// compare part count and registry
	if( part_count != part_reg )
	{
		// re-create part list if necessary
		ds_list_destroy( part_list );
		
		part_list = scr_ship_get_parts( parent );	
		
		var ship_core = parent.ship_core;
		if( instance_exists( ship_core ) )
			scr_ds_list_merge( part_list, ship_core.software );
	}
}

// update target_id list
var size;

size = ds_list_size( target_id );

for( var i = size-1; i >= 0; i-- )
{
	if( instance_exists( target_id[|i] ) == false )
		ds_list_delete( target_id, i );
	else if( target_id[|i].owner == owner )
		ds_list_delete( target_id, i );
}

// look for new targets
var obj_type;
size = ds_list_size( part_list );
for( var i = 0; i < size; i++ )
{
	if( instance_exists( part_list[|i] ) )
	{
		obj_type = part_list[|i].type;
		if( obj_type >= 0 && obj_type <= 2 && part_list[|i].owner != owner )	
		{
			scr_ds_list_add_unique( target_id, part_list[|i] );
		}
	}
}

// add targets to childern
size = ds_list_size( owned_childern );
if( size > 0 )
{
	if( ds_list_size( target_id ) > 0 ) // attack hacked targets
	{
		scanning = false;
		
		for( var i = 0; i < size; i++ )
		{
			ds_list_clear( owned_childern[|i].target_id );
			
			ds_list_add( owned_childern[|i].target_id, target_id[|0] );
		}
	}
	else	// resume scanning
	{
		scanning = true;
	}
}