/// @description Ini vars

// Inherit the parent event
event_inherited();

hacking_target_list = ds_list_create();	 // part list of ship

hacking_script = 0;

hacking_current[0] = false;
hacking_current[1] = -4;
hacking_current[2] = -4;

AI_CPU_limit = 250;

target_index = global.player;
target_ship = scr_ship_from_owner( target_index );
target_core = global.owner_core[ target_index ];