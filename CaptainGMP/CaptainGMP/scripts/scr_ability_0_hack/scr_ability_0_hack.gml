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
	if( node.secret_owner != core.owner ) // conditions
	{
		var cost, time;
		cost = scr_cost_hacking( core.hacking_level );
		time = node.stat[var_security_level,0] / core.hacking_level * 3;
		
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
				node.hack_level = core.hacking_level;
			}
		}
	}
}

return false;