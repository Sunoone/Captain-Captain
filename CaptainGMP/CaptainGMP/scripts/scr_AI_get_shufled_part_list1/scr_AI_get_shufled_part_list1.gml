/// @description scr_AI_get_shufled_part_list( index )
/// @param index

var i = argument0;

if( ds_list_empty( action_list[i] ) )
{
	if( action_list_cooldown[i] > 0 )
		action_list_cooldown[i] -= global.DeltaTime;
	else
	{	
			// fill list with parts
		scr_AI_get_part_list( target_index, action_list[i] );
		ds_list_shuffle( action_list[i] );
		
			// cooldown for list repopulate
		action_list_cooldown[i] = scr_random_offset(AI_timedelay, AI_inaccuracy);
	}
}