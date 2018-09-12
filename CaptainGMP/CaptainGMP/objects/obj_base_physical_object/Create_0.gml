/// @description Ini vars

// this is the ansestor of all objects that have a physical presence (core, regulator and software) on the ship
event_inherited();

// This object holds the HP system
scr_stat_update( id, var_HP_max );
HP = stat[ var_HP_max, 0 ];

HP_max_old = stat[ var_HP_max, 0 ];