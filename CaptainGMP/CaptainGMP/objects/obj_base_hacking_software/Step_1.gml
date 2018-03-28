/// @description Update Target Lists
/*
// exit event in case of hacked or quarantined node
if( owner != original_owner || quarantine )
{
	exit;
}

if( switch_active ) // debug
{
	if( target_ship == -4 || instance_exists( target_ship ) == false ) // find a new target ship
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

	if( instance_exists( target_ship ) ) // if the hacking target exists
	{			
		
		// update part count
		target_part_count = ds_list_size( target_ship.hackable_parts_list );
	
		var ship_core = target_ship.ship_core;
		if( instance_exists( ship_core ) )
			target_part_count += ds_list_size( ship_core.software );
				
		// update part registry
		target_part_reg = ds_list_size( target_part_list );
	
		// compare part count and registry
		if( target_part_count != target_part_reg && target_part_count > 0)
		{
			// re-create part list if necessary		
			ds_list_copy( target_part_list, target_ship.hackable_parts_list );
			
			var ship_core = target_ship.ship_core;
			if( instance_exists( ship_core ) )
				scr_ds_list_merge( target_part_list, ship_core.software );
			
			ds_list_shuffle( target_part_list );
		}
	}
}

// update attack_id list
var size, target_owner;

size = ds_list_size( attack_id );
target_owner = target_ship.owner;

for( var i = size-1; i >= 0; i-- )
{
	if( instance_exists( attack_id[|i] ) == false )
		ds_list_delete( attack_id, i );
	else if( attack_id[|i].owner != target_owner )
		ds_list_delete( attack_id, i );
	else if( attack_id[|i].can_be_hacked == false && attack_id[|i].can_be_hacked_parent == false )
		ds_list_delete( attack_id, i );
	else if( attack_id[|i].secret_owner == owner )
		ds_list_delete( attack_id, i );
}

if( switch_active ) // debug
{

	// look for new targets
	var obj_type;
	size = ds_list_size( target_part_list );
	for( var i = 0; i < size; i++ )
	{
		if( instance_exists( target_part_list[|i] ) )
		{
			obj_type = target_part_list[|i].type;
		
			if( obj_type >= 0 && obj_type <= 2 && target_part_list[|i].owner != owner )
			{
				if( target_part_list[|i].can_be_hacked || target_part_list[|i].can_be_hacked_parent ) // is the part hackable?
				{
					if( switch_active ) // debug
						scr_ds_list_add_unique( attack_id, target_part_list[|i] );
				}
			}
		}
	}

}


// Antivirus code ---------------------------------------------------------------------------------------------------------------------
	// Update Target Lists

if( instance_exists( parent ) )
{	
	// update part count
	defend_part_count = ds_list_size( parent.hackable_parts_list );
	
	var ship_core = parent.ship_core;
	if( instance_exists( ship_core ) )
		defend_part_count += ds_list_size( ship_core.software );
		
	// update part registry
	defend_part_reg = ds_list_size( defend_part_list );
	
	// compare part count and registry
	if( defend_part_count != defend_part_reg && defend_part_count > 0)
	{
		// re-create part list if necessary				
		ds_list_copy( defend_part_list, parent.hackable_parts_list );
		
		var ship_core = parent.ship_core;
		if( instance_exists( ship_core ) )
			scr_ds_list_merge( defend_part_list, ship_core.software );
	}
}

// update defend_id list
var size;

size = ds_list_size( defend_id );

for( var i = size-1; i >= 0; i-- )
{
	if( instance_exists( defend_id[|i] ) == false )
		ds_list_delete( defend_id, i );
	else if( defend_id[|i].owner == owner )
		ds_list_delete( defend_id, i );
	else if( defend_id[|i].quarantine )
		ds_list_delete( defend_id, i );
}

// look for new targets
var obj_type;
size = ds_list_size( defend_part_list );
for( var i = 0; i < size; i++ )
{
	if( instance_exists( defend_part_list[|i] ) && defend_part_list[|i] > 0 )
	{
		obj_type = defend_part_list[|i].type;
		if( obj_type >= 0 && obj_type <= 2 && defend_part_list[|i].owner != owner )	
		{
			scr_ds_list_add_unique( defend_id, defend_part_list[|i] );
		}
	}
}