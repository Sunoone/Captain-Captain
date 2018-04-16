/// @description hack targets

var player_index = player_owner;
	
// Get a refrence to the players ship
var ship;

ship = scr_ship_from_owner( player_index );

	// exit in case of ship no longer existing
if( !instance_exists( ship ) )
	exit;
	
	// check if there are parts to hack
if( ds_list_empty(defence_target_list) && defence_current[0] == false )
	exit;
	
	// preform new hack
if( defence_current[0] == false && core.cpu_available > 100 )
{
	var node;
	
	for( var i = ds_list_size( defence_target_list )-1; i >= 0; i-- )
	{
		node = defence_target_list[|i];
		ds_list_delete( defence_target_list, i );
		
		if( instance_exists( node ) )
		{
			if( scr_object_apparent_owner_get( node, owner ) != owner )
			{
				if( scr_ability_excecute_script( 0, defence_script, node, core ) )
				{
					var cost = scr_ability_excecute_script( 1, defence_script, node, core );
					
					if( cost < core.cpu_available )
					{
					
						defence_current[0] = true;		// scan active
						defence_current[1] = node;		// scan target
					
						defence_current[2] = scr_ability_initiate( 
							core, 
							node, 
							9,
							scr_ability_excecute_script( 2, defence_script, node, core ),
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
	if( defence_current[0] == false )
		exit;
}

	// Can we scan again?
if( action_delay > 0 )
{
	action_delay -= global.DeltaTime;
	if( action_delay <= 0 )
		defence_current[0] = false;	
}
else if( ds_list_find_index( core.running_abilities_index, defence_current[2] ) == -1 ) // scan target finished?
{
	action_delay = AI_timedelay + (random( AI_inaccuracy * 2 ) - AI_inaccuracy);
}