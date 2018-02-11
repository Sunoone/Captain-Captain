/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here
name = "Base Hacking Software";

type = 0; // declare as software

interface_width = 4;
ds_list_add( allowed_type, obj_base_hacking_regulator );

	// internal variables
part_list = ds_list_create();
part_count = 0;
part_reg = 0;

target_id = ds_list_create();

// get a target ship
target_ship = -4;


// debug
switch_active = true;