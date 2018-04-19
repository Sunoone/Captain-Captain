/// @description scr_AI_preform_action( index, script, core, icon, limit, sound )
/// @param index
/// @param script
/// @param core
/// @param icon
/// @param limit
/// @param sound

// this script preforms the actions based on the standart variables within an AI and the provided arguments

var i, script, core;

i =			argument0;
script =	argument1;
core =		argument2;

// preform action
if( !ds_list_empty( action_list[i] ) || action_current[i,0] )
{
	if( action_current[i,0] == false && core.cpu_available > AI_CPU_limit )
		scr_AI_execute_script_on_list( action_list[i], i, script, core, argument3, argument4, argument5 );

	// found a suitable target
	if( action_current[i,0] )
	{
		// can another action be preformed?
		if( action_delay[i] > 0 )
		{
			action_delay[@ i] -= global.DeltaTime;
			if( action_delay[i] <= 0 )
				action_current[@ i,0] = false;	
		}
		else if( ds_list_find_index( core.running_abilities_index, action_current[i,2] ) == -1 ) // scan target finished?
		{
			action_delay[@ i] = scr_random_offset(AI_timedelay, AI_inaccuracy);
		}
	}
}