/// @description scr_ability_10_ability_0_on( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script activates ability 0 on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.owner && node.stat[var_ability_0_active, 0] == 0 ) // conditions
	{
		var cost, time;
		
		cost = scr_ability_excecute_script( 1, node.ability_0_script, node.ability_0_target, core );
		time = 0;
		
		switch( argument0 ) // mode switch
		{
			case 0: // test
				return true;
		
			case 1: // cost
				return cost;
			
			case 2: // time in sec
				return time;
			
			case 3: // real
			{
				scr_status_effect_add( node, core, 0, var_ability_0_active, 1 );
			}
		}
	}
}

return false;