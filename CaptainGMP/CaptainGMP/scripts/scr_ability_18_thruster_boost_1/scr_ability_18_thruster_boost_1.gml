/// @description scr_ability_18_thruster_boost_1( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param owner

// Boost thrust level of thruster by 200% for 5 sec
// Ability cooldowns need to be implemented

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active && scr_id_check_parentage( node, obj_base_truster_component ) ) // conditions for the ability
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
				// add a buff to the thruster
				scr_buff_add( node, node, 5, false, var_maxThrust, stat[var_maxThrust, 1] * 2, spr_action_buff );
			}
		}
	}
}

return false;