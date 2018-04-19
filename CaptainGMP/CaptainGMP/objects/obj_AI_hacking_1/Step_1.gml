/// @description populate target lists

if( !instance_exists( core ) )
{
	instance_destroy();
	exit;
}

	// get hacking & advanced part list
for( var i = 0; i < 2; i++ )
{
	if( ds_list_empty( action_list[i] ) )
	{
		if( action_list_cooldown[i] > 0 )
			action_list_cooldown[i] -= global.DeltaTime;
		else
		{
			scr_AI_get_shufled_part_list( i );
			action_list_cooldown[i] = scr_random_offset(AI_timedelay + AI_timedelay * i, AI_inaccuracy);
		}
	}
}