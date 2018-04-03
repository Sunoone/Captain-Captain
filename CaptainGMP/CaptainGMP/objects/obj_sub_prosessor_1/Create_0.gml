/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Debug Hacking Component";

security_level = 4;
clock_speed = 1;

sprite_mode_0 = spr_subProcessor;
sprite_mode_1 = spr_subProcessor_2;

	// register control ability
scr_ability_register( spr_action_command, 4, 3, true, "Control this node." );

	// register raise ability
scr_ability_register( spr_action_buff, 5, 2, true, "Raise defence" );