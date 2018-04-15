/// @description scr_ability_initiate( core, target_id, script, time, cost, icon, sound )
/// @param core
/// @param target_id
/// @param script
/// @param time
/// @param cost
/// @param icon
/// @param sound


var core, node;
core = argument0;
node = argument1;

if( instance_exists( core ) && instance_exists( node ) )
{
	var index = get_timer();
	
	with( core )
	{
		ds_list_add( running_abilities_index,	index );
		ds_list_add( running_abilities_target,	node );
		ds_list_add( running_abilities_script,	argument2 );
		ds_list_add( running_abilities_time,	argument3 );
		ds_list_add( running_abilities_maxTime,	argument3 );
		ds_list_add( running_abilities_cost,	argument4 );
		ds_list_add( running_abilities_icon,	argument5 );
		ds_list_add( running_abilities_sound,	argument6 );
	}
	
	scr_ability_register_node( node, core, index, argument5 );
	
	return( index );
}