/// @description scr_ability_10_toggleAbility_0( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script toggles ability 0 on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.owner ) // conditions
	{
		var cost, time, delta;
		
		if( node.stat[var_ability_0_active, 0] > 0)
			delta = 1;
		else
			delta = -1;
		
		cost = delta * stat[var_ability_0_script, 0];
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
				// raise security level
				if( delta == -1 )
					scr_status_effect_remove_value( node, var_ability_0_active );
				else
					scr_status_effect_add( node, core, cost, var_ability_0_active, 1 );
			}
		}
	}
}

return false;