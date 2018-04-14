/// @description scr_ability_6_scan( mode, target_id, core )
/// @param mode
/// @param target_id
/// @param core

// this script scans a node and reveals the secret ownership

var node, core;
node = argument1;
core = argument2;

if( instance_exists( node ) && instance_exists( core ) ) // check object existance
{
	if( core.owner == node.owner ) // conditions
	{
		var cost, time;
		
		cost = 100;
		time = node.stat[var_cpu_cost,0] / cost;
		
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
				// scan node
				if( node.apparent_owner[ core.owner ] != node.secret_owner && core.owner == global.player )
					audio_play_sound( snd_interface_warning, 0, false );
				node.apparent_owner[ core.owner ] = node.secret_owner;
			}
		}
	}
}

return false;