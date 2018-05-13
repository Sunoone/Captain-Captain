/// @description Boost Thruster
if( active && owner == global.player) 
	scr_buff_add( id, id, 5, false, var_maxThrust, stat[var_maxThrust, 1] * boost, spr_action_buff );
