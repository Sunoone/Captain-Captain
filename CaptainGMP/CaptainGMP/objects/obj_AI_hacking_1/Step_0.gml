/// @description hack targets

	// exit in case of ship no longer existing
if( !instance_exists( target_ship ) || !instance_exists( target_core ) )
	exit;
	
	// check if there are parts to hack
if( ds_list_empty(hacking_target_list) && hacking_current[0] == false )
	exit;
	
	// preform new hack
if( hacking_current[0] == false && core.cpu_available > AI_CPU_limit )
{
	var node;
	
	for( var i = ds_list_size( hacking_target_list )-1; i >= 0; i-- )
	{
		node = hacking_target_list[|i];
		ds_list_delete( hacking_target_list, i );
		
		if( instance_exists( node ) )
		{
			if( scr_object_apparent_owner_get( node, owner ) != owner )
			{
				if( scr_ability_excecute_script( 0, hacking_script, node, core ) )
				{
					var cost = scr_ability_excecute_script( 1, hacking_script, node, core );
					
					if( cost < core.cpu_available )
					{
					
						hacking_current[0] = true;		// scan active
						hacking_current[1] = node;		// scan target
					
						hacking_current[2] = scr_ability_initiate( 
							core, 
							node, 
							0,
							scr_ability_excecute_script( 2, hacking_script, node, core ),
							cost,
							spr_action_basic_hack,
							-4
						);
					
						break;
					}
					
				}
			}
		}
	}
	
		// not found a suitable scan target
	if( hacking_current[0] == false )
		exit;
}

	// Can we scan again?
if( action_delay > 0 )
{
	action_delay -= global.DeltaTime;
	if( action_delay <= 0 )
		hacking_current[0] = false;	
}
else if( ds_list_find_index( core.running_abilities_index, hacking_current[2] ) == -1 ) // scan target finished?
{
	action_delay = AI_timedelay + (random( AI_inaccuracy * 2 ) - AI_inaccuracy);
}