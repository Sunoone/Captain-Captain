/// @description Scanning

	// in case of owner change
if( owner != delta_owner )
{
		// clear the scan list
	ds_list_clear(scan_list);
	
		// clear the active ability
	scr_status_effect_reset_value( scan_current[1], var_ability_0_active );
	
		// interupt current scan
	scan_current[0] = false;
}

// exit event if met with any of the conditions are met
if( quarantine || owner < 0 || stat[var_ability_0_active,0] <= 0 )
{
	exit;
}


// Get a refrence to the owner's ship
var ship, core;

ship = scr_ship_from_owner( owner );
core = global.owner_core[owner];

	// exit in case of ship or core no longer existing
if( !instance_exists( ship ) || !instance_exists( core ) )
	exit;

	// check if there are parts to scan
if( ds_list_empty(scan_list) && scan_current[0] == false )
	exit;

	// preform new scan
if( scan_current[0] == false )
{
	var node;
	
	for( var i = ds_list_size( scan_list )-1; i >= 0; i-- )
	{
		node = scan_list[|i];
		ds_list_delete( scan_list, i );
		
		if( instance_exists( node ) )
		{
			if( scr_object_apparent_owner_get( node, owner ) == owner )
			{
				if( scr_ability_excecute_script( 0, ability_0_script, node, core ) )
				{
					scan_current[0] = true;		// scan active
					scan_current[1] = node;		// scan target
					
					scan_current[2] = scr_ability_initiate( 
						core, 
						node, 
						ability_0_script,
						scr_ability_excecute_script( 2, ability_0_script, node, core ),
						scr_ability_excecute_script( 1, ability_0_script, node, core ),
						scan_icon,
						-4
					);
					
					break;
				}
			}
		}
	}
	
		// not found a suitable scan target
	if( scan_current[0] == false )
		exit;
}

	// scan target finished?
if( ds_list_find_index( core.running_abilities_index, scan_current[2] ) == -1 )
{
	scan_current[0] = false;	
}