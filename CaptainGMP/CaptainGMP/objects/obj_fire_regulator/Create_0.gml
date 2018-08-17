/// @description Ini vars

// Inherit the parent event
event_inherited();

// Overwrite vars

interface_width = 3;

name = "Debug Turret Regulator";

scr_status_effect_new( id, 0, var_rotation_max, false, obj_base_turret_component, 0.5, "Aiming assistance", sprite_index, 0, true );