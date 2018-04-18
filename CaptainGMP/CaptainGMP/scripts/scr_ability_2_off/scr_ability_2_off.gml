/// @description scr_ability_2_off( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script de-activates an object

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.original_owner && node.owner == node.original_owner && node.active == true) // conditions
	{
		var cost, time;
		cost = -1 * ( node.stat[var_cpu_cost,0] + ds_grid_get_sum( node.modification, 0, 1, ds_grid_width(node.modification), 1 ) );
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
				node.active = false;	
			}
		}
	}
}

return false;