/// @description Ini vars

// Inherit the parent event
event_inherited();

type = 2; // register as a component
name = "Debug Truster";

	// register boosting ability
scr_ability_register( spr_action_buff, 18, 0, true, "Boost Thrusters", 90 );

boost = 0.5;
