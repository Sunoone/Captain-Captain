/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here
name = "Base Hacking Software";

type = 0; // declare as software
security_level = 7;

interface_width = 6;
ds_list_add( allowed_type, obj_base_hacking_regulator );

	// internal variables
target_part_list = ds_list_create();
target_part_count = 0;
target_part_reg = 0;

defend_part_list = ds_list_create();
defend_part_count = 0;
defend_part_reg = 0;

scanning = true;

attack_id = ds_list_create();
defend_id = ds_list_create();

// get a target ship
target_ship = -4;


// debug
switch_active = true;