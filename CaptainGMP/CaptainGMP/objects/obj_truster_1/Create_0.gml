/// @description Ini vars

// Inherit the parent event
event_inherited();

name = "Debug Truster";

stat[ var_maxThrust, 1] = 1000;	// Max Trust

	// register boosting ability
scr_ability_register( spr_action_buff, 18, 0, true, "Boost Thrusters", 90 );

//boost = 0.5;
//boost_time = 2.5;
//boost_cooldown = 7.5;
//boost_ready = true;

