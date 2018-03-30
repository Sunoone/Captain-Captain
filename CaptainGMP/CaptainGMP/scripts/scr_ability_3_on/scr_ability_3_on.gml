/// @description scr_ability_2_on( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script activates an object

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.owner == core.owner && node.active == false) // conditions
	{
		var cost, time;
		cost = node.cpu_cost;
		time = 1;
		
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
				node.active = true;	
			}
		}
	}
}

return false;