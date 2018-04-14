/// @description scr_ability_1_disable( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script scrambles the ownership of an object, disabeling it

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.secret_owner == core.owner && node.owner >= 0 && node.owner != core.owner ) // conditions
	{
		var cost, time;
		cost = 100;
		time = node.stat[var_cpu_cost,0] / cost;
		
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
				var rand = -1 * get_timer();
				node.owner = rand;
				scr_object_apparent_owner_set( node, rand );
			}
		}
	}
}

return false;