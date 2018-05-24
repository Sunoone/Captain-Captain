/// @description ini vars

// Inherit the parent event
event_inherited();

name = "Debug Hacking Regulator";

scr_ds_grid_add_column( buff_childern, var_security_level, 1, spr_hacking_regulator ); // add buff
//scr_ds_grid_add_column( buff_childern, var_cpu_cost, -1000, spr_hacking_regulator ); // add (debug) buff