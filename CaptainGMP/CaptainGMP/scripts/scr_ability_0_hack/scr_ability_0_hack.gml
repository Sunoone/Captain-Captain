/// @description scr_ability_0_hack( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param owner

// Ability script for the basic hack on target

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( scr_object_apparent_owner_get( node, core.owner ) != core.owner && core.stat[var_core_hacking_level, 0] > 0 ) // conditions
		{
			if( node.can_be_hacked || node.can_be_hacked_parent )
			{
				var cost, time;
				cost = scr_cost_hacking( core.stat[var_core_hacking_level, 0] );
				time = (node.stat[var_security_level, 0] / core.stat[var_core_hacking_level, 0]) * 10;
		
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
						// Hacking code
						node.secret_owner = core.owner;
						node.apparent_owner[ core.owner ] = core.owner;
						node.hack_level = core.stat[var_core_hacking_level, 0];
					}
				}
			}
		}
	}
}

return false;