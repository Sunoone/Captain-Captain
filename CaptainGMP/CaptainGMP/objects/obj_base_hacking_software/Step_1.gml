/// @description Update Target Lists

if( target_ship == -4 || instance_exists( target_ship ) == false )
{
	var size = ds_list_size( global.registry );
	for( var i = 0; i < size; i++ )
	{
		var reg =  global.registry[|i];
		if( reg != parent && reg >= 0 && instance_exists( reg ) )
		{
			target_ship = reg;
			break;
		}
	}
}

if( instance_exists( target_ship ) )
{	
	// update part count
	part_count = target_ship.draw_grid_object_index + target_ship.draw_grid_turret_index
	
	var ship_core = target_ship.ship_core;
	if( instance_exists( ship_core ) )
		part_count += ds_list_size( ship_core.software );
	
	// update part registry
	part_reg = ds_list_size( part_list );
	
	// compare part count and registry
	if( part_count != part_reg )
	{
		// re-create part list if necessary		
		scr_ship_get_parts( part_list, target_ship );	
		
		var ship_core = target_ship.ship_core;
		if( instance_exists( ship_core ) )
			scr_ds_list_merge( part_list, ship_core.software );
			
		ds_list_shuffle( part_list );
	}
}

// update target_id list
var size, target_owner;

size = ds_list_size( target_id );
target_owner = target_ship.owner;

for( var i = size-1; i >= 0; i-- )
{
	if( instance_exists( target_id[|i] ) == false )
		ds_list_delete( target_id, i );
	else if( target_id[|i].owner != target_owner )
		ds_list_delete( target_id, i );
	else if( target_id[|i].can_be_hacked == false && target_id[|i].can_be_hacked_parent == false )
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
			if( part_list[|i].can_be_hacked || part_list[|i].can_be_hacked_parent ) // is the part hackable?
			{
				scr_ds_list_add_unique( target_id, part_list[|i] );
			}
		}
	}
}