/// @description Boost Thruster
/*
if( boost_ready && active && owner == global.player) 
{
	scr_buff_add( id, id, boost_time, false, var_maxThrust, stat[var_maxThrust, 1] * boost, spr_action_buff );
	boost_ready = false;
	scr_timer_add( id, boost_cooldown, 0 );
}
