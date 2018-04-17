/// @description Ini vars

// Inherit the parent event
event_inherited();

defence_target_list = ds_list_create();	 // part list of ship

defence_script = 9;

defence_current[0] = false;
defence_current[1] = -4;
defence_current[2] = -4;

AI_CPU_limit = 0;