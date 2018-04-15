/// @description Ini vars

core = -4;
owner = -4;
player_owner = global.player;

object_list = ds_list_create();	 // part list of ship
hacking_target_list = ds_list_create();	 // part list of ship

hacking_current[0] = false;
hacking_current[1] = -4;
hacking_current[2] = -4;

AI_timedelay = 1;		// time in sec
AI_inaccuracy = 0.1;	// 10% inaccuracy

action_delay = 0;