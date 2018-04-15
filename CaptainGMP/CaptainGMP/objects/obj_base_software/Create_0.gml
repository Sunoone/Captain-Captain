/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite and add new vars here
name = "Base Software";
type = 0;

// hack to keep software healty
stat[var_HP_max, 1] = 1000000000;
stat[var_HP, 1] = 1000000000;
stat[var_regen, 1] = 1;
stat[var_security_level, 1] = 6;
stat[var_cpu_cost, 1] = 500;