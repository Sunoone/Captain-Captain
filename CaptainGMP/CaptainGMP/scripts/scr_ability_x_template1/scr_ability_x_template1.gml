/// @description scr_ability_18_thruster_boost_1( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param owner

// Ability script template

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // conditions for the ability
	{
		var cost, time;
		cost = 0;	// Cost calculation
		time = 0;	// Time calculation
		
		switch( argument0 ) // mode switch
		{
			case 0: // test conditions
				return true;
		
			case 1: // cost
				return cost;
			
			case 2: // time in sec
				return time;
			
			case 3: // real
			{
				// Ability actions
			}
		}
	}
}

return false;