/// @description Ini vars

// Inherit the parent event
event_inherited();

name = "Base Shield Generator";

stat[var_shield_max,1] = 100;
stat[var_shield_regen,1] = 0.25;	// 25% shield regen per sec

shield_buffer = 0;
shield_on = true;