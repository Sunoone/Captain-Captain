/// @description Ini vars

core = -4;
owner = -4;

AI_timedelay = 2.5;		// time in sec
AI_inaccuracy = 0.1;	// 10% inaccuracy
AI_CPU_limit = 500;		// this limit dictates wherther the AI will preform it's actions
AI_action_limit = 1;



	// Actions
action_delay[0] = 0;

action_current[0,0] = false;
action_current[0,1] = -4;
action_current[0,2] = -4;

action_list[0] = ds_list_create();
action_list_cooldown[0] = 0;

	// Target
target_index = -4;
target_ship = -4;
target_core = -4;