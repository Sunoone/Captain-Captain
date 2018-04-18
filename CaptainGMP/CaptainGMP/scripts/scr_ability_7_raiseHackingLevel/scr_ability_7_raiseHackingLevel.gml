/// @description scr_ability_7_raiseHackingLevel( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script raises the hacking level of a hacked node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( node.secret_owner == core.owner && node.owner >= 0 && node.hack_level < core.hacking_level + 2 ) // conditions
		{
			var cost, time;
			cost = scr_cost_hacking( core.hacking_level + 2 ) - scr_cost_hacking( core.hacking_level ) ;
			time = scr_cost_node_abs( node ) / cost;
		
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
					node.hack_level = core.hacking_level + 2;
				}
			}
		}
	}
}

return false;