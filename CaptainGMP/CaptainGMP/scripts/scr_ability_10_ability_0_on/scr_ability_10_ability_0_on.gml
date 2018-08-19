/// @description scr_ability_10_ability_0_on( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script activates ability 0 on a node

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( node.active ) // Node active?
	{
		if( core.owner == node.owner && node.stat[var_ability_0_active, 0] == 0 ) // conditions
		{
			var cost, time;
		
			cost = scr_ability_excecute_script( 1, node.ability_0_script, node.ability_0_target, core );
			time = 0;
		
			switch( argument0 ) // mode switch
			{
				case 0: // test
					return scr_buff_valid( node, "Ability 0 Active", core.owner );
		
				case 1: // cost
					return cost;
			
				case 2: // time in sec
					return time;
			
				case 3: // real
				{
					var b = scr_buff_add( core.owner, node, "Ability 0 Active", -1, cost );
					
						// set the ability 0 info
					/*
					var s = scr_ds_grid_find_value_width( node.status_effect_out, node.Buff[# b, 4], 1 );
					node.status_effect_out[# s,7] = node.ability_graphic[|0]; // icon
					node.status_effect_out[# s,6] = node.ability_tooltip[|0]; // name
					scr_status_effect_retract( node, s );
					scr_status_effect_push( node, s );
					*/
				}
			}
		}
	}
}

return false;