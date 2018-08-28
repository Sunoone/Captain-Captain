/// @description Ini vars

// Inherit the parent event
event_inherited();

interface_width = 1;

target_x = "0";
target_y = "0";

ds_list_add( allowed_type, obj_base_turret_component );

name = "Base Turret Regulator";

stat[var_cpu_cost, 1] = 250;			// base cost of object