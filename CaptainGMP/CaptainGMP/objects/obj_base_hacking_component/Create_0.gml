/// @description Ini vars

// Inherit the parent event
event_inherited();

// Overwrite inherited vars

name = "Base Hacking Component";
type = 2; // declare as component

	// internal variuables
target_id = -4;
clock_speed = 1;
bonus_clock = 0;

defence_bonus = 0.5; // 50% effective clock speed boost when hacking components on own ship

max_hack_level = 1;

hack_cost = 0.25; // the cost of keeping a node hacked
hacked_list = ds_list_create();

mode = 0; // hacking or antivirus mode
sprite_mode_0 = -4;
sprite_mode_1 = -4;
