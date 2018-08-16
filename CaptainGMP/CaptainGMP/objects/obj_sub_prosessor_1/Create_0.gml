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
scr_ability_register( spr_action_command, 4, 3, true, "Control this node.", 60 );

	// register raise Security Level ability
scr_ability_register( spr_action_buff, 5, 2, true, "Raise Security Level", -20 );

	// register stealth ability
scr_ability_register( spr_action_stealth, 7, 3, true, "Rootkit - Hack Level +2", -20 );

	// create new status effect
scr_status_effect_new( id, 1, var_core_cpu_bonus, true, obj_base_core, 500, "Auxiliary Processor", sprite_index, 0, false );