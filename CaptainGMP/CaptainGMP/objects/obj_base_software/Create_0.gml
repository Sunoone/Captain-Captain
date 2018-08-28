/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite and add new vars here
name = "Base Software";
type = 0;

// stat changes
stat[var_security_level, 1] = 6;
stat[var_cpu_cost, 1] = 500;

scr_stat_update(id);