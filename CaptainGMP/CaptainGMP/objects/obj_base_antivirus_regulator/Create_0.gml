/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here

name = "Base Antivirus Regulator";

type = 1; // declare as regulator
security_level = 5;

interface_width = 2;
ds_list_add( allowed_type, obj_base_hacking_component );

	// internal variables
target_id = ds_list_create();
