/// @description scr_ability_4_control( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script transfers ownership of an object

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.secret_owner == core.owner && node.owner != core.owner ) // conditions
	{
		var cost, time;
		cost = node.stat[var_cpu_cost,0];
		time = cost / (power( node.hack_level, 2 ) * 10 + 1);
		
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
				node.owner = core.owner;
				node.register_abilities = true;
				
					// remove all bufs
				// scr_status_effect_remove( node, -1 );
				
					// set apparent owner
				scr_object_apparent_owner_set( node, core.owner );
			}
		}
	}
}

return false;