/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here

name = "Base Hacking Regulator";

type = 1; // declare as regulator
security_level = 4;

interface_width = 2;
ds_list_add( allowed_type, obj_base_hacking_component );

	// internal variables
target_id = -4;

attack_id = ds_list_create();
defend_id = ds_list_create();