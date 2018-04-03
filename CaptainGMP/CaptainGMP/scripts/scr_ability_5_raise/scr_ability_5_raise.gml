/// @description scr_ability_5_raise( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script raises the security level on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.owner && node.stat[var_security_level,0] < core.hacking_level ) // conditions
	{
		var cost, time, delta;
		
		delta = core.hacking_level - node.stat[var_security_level,0];
		cost = delta * 100;
		time = delta * 2;
		
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
				scr_status_effect_add( node, core, cost, var_security_level, delta );
			}
		}
	}
}

return false;