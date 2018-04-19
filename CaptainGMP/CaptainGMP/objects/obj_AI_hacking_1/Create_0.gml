/// @description Ini vars

// Inherit the parent event
event_inherited();

hacking_script = 0;
hacking_sprite = spr_action_basic_hack;

advanced_script = 1;
advanced_sprite = spr_action_disrupt;

AI_CPU_limit = 250;
AI_timedelay = 1.5;		// time in sec

target_index = global.player;
target_ship = scr_ship_from_owner( target_index );
target_core = global.owner_core[ target_index ];

	// Raize the number of actions
scr_AI_set_actions( 1 );