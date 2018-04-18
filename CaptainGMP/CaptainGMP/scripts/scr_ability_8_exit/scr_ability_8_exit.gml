/// @description scr_ability_8_exit( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script removes the hack and reverts the control back to the original owner

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( node.secret_owner == core.owner || node.owner == core.owner ) // conditions
		{
			var cost, time;
		
			cost = -1 * scr_cost_hacking( node.hack_level );
			cost -= scr_cost_status_effects( node, core );
			if( node.owner == core.owner )
				cost -= node.stat[var_cpu_cost,0];
		
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
					if( node.owner == core.owner )
					{
						node.active = false;
						node.owner = node.original_owner;
					}
				
					node.secret_owner = node.original_owner;
					node.register_abilities = true;
				
						// remove all bufs
					scr_status_effect_remove( node, -1 );
				
						// set apparent owner
					scr_object_apparent_owner_set( node, node.original_owner );
				}
			}
		}
	}
}

return false;