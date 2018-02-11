/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here
name = "Base Antivirus Software";

type = 0; // declare as software
security_level = 7;

interface_width = 4;
ds_list_add( allowed_type, obj_base_antivirus_regulator );

	// internal variables
part_list = ds_list_create();
part_count = 0;
part_reg = 0;
scanning = true;

target_id = ds_list_create();