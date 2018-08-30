/// @description Ini vars

// Inherit the parent event
event_inherited();

// this is the ancestor of all regulators
type = 1; // set this object to be a regulator
name = "Base Regulator";

stat[ var_HP_max, 1 ] = 100;