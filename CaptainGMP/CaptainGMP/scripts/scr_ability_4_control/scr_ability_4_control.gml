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
	if( node.secret_owner == core.owner && node.owner >= 0 && node.owner != core.owner ) // conditions
	{
		var cost, time;
		cost = node.cpu_cost;
		time = node.cpu_cost / cost;
		
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
			}
		}
	}
}

return false;