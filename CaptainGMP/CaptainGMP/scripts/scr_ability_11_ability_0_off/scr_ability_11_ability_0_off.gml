/// @description scr_ability_11_ability_0_off( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script de-activates ability 0 on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.owner && node.stat[var_ability_0_active, 0] > 0 ) // conditions
	{
		var cost, time;
		
		cost = -1 * scr_ability_excecute_script( 1, node.ability_0_script, node.ability_0_target, core );
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
				scr_status_effect_reset_value( node, var_ability_0_active );
			}
		}
	}
}

return false;