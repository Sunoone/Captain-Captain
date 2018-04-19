/// @description populate target lists

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

if( kickstart )
{
	target_index = owner;
	target_ship = scr_ship_from_owner( owner );
	target_core = global.owner_core[ owner ];
	
	kickstart = false;	
}

	// get defence part list
if( ds_list_empty( action_list[0] ) )
{
	if( action_list_cooldown[0] > 0 )
		action_list_cooldown[0] -= global.DeltaTime;
	else
	{
		scr_AI_get_shufled_part_list( 0 );
		action_list_cooldown[0] = scr_random_offset(AI_timedelay, AI_inaccuracy);
	}
}