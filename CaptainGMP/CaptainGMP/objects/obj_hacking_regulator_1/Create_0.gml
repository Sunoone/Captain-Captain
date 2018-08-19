/// @description ini vars

// Inherit the parent event
event_inherited();

name = "Debug Hacking Regulator";

scr_status_effect_add( id, "Improved Firewalling" );

//scr_ds_grid_add_column( buff_childern, var_security_level, 1, spr_hacking_regulator ); // add buff
//scr_ds_grid_add_column( buff_childern, var_cpu_cost, -1000, spr_hacking_regulator ); // add (debug) buff
//scr_status_effect_new( id, 0, var_security_level, obj_base_hacking_component, 1, "Improved Firewalling", spr_hacking_regulator, 0, false );
//scr_status_effect_new( id, 3, var_security_level, obj_base_software, 1, "Improved Firewalling", spr_hacking_regulator, 0, false );