/// @description scr_ability_5_raiseSecurityLevel( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script raises the security level on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( core.owner == node.owner && node.active && scr_object_apparent_owner_get( node, core.owner ) == core.owner ) // conditions
		{
			var cost, time;
		
			cost = 250;
			time = 2.5;
		
			switch( argument0 ) // mode switch
			{
				case 0: // test
					return scr_buff_valid( node, "Raise Security Level", core.owner );
		
				case 1: // cost
					return cost;
			
				case 2: // time in sec
					return time;
			
				case 3: // real
				{
					// raise security level
					// scr_status_effect_add( node, core, cost, var_security_level, delta );
					scr_buff_add( core.owner, node, "Raise Security Level", 20, cost );
				}
			}
		}
	}
}

return false;