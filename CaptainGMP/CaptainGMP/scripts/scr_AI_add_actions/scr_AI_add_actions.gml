/// @description scr_AI_set_actions( number )
/// @param nember

// this script raizes the number of actions that an AI can preform to the given number

for( var i = argument0; i > 0; i-- )
{
	action_delay[i] = 0;

	action_current[i,0] = false;
	action_current[i,1] = -4;
	action_current[i,2] = -4;

	action_list[i] = ds_list_create();
}