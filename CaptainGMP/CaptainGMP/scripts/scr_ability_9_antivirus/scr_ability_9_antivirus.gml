/// @description scr_ability_9_antivirus( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param owner

// Ability script for antivirus

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( scr_object_apparent_owner_get( node, core.owner) != core.owner || node.owner != core.owner ) // conditions
		{
			var cost, time;
			cost = scr_cost_antivirus( core.stat[var_core_hacking_level, 0] );
			if( node.owner != core.owner )
				cost += scr_cost_node_abs( node );
		
			time = ( node.hack_level / core.stat[var_core_hacking_level, 0] ) * 2;
		
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
					node.owner = core.owner;
					node.hack_level = 0;
				
					node.register_abilities = true;
				
						// remove all bufs
					//scr_status_effect_remove( node, -1 );
				
						// set apparent owner
					scr_object_apparent_owner_set( node, core.owner );
				}
			}
		}
	}
}

return false;