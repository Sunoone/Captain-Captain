/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here
name = "Base Hacking Software";

type = 0; // declare as software

interface_width = 6;
ds_list_add( allowed_type, obj_base_hacking_regulator );

	// internal variables
scan_list = ds_list_create();		// part list of ship

scan_current[0] = false;			// array to hold the current scan data
scan_current[1] = -4;
scan_current[2] = -4;

ability_0_script = 6;				// set the scan script

scan_icon = spr_action_scan;

kickstart = true;

	// register activate scanning ability
scr_ability_register( spr_action_scan_on, 10, 0, true, "Activate Scanning", 80 );
scr_ability_register( spr_action_scan_off, 11, 0, true, "De-activate Scanning", 80 );

// ability cost
CPU_reserve = 300;