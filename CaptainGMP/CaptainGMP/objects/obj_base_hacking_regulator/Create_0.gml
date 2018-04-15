/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite variables here

name = "Base Hacking Regulator";

type = 1; // declare as regulator

interface_width = 2;
ds_list_add( allowed_type, obj_base_hacking_component );

stat[var_cpu_cost, 1] = 250;			// base cost of object

	// internal variables
