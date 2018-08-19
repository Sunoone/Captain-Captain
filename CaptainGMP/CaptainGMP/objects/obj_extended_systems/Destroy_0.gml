/// @description Clean

	// destroy abilities
scr_ability_destroy_structure( id );

// Inherit the parent event
event_inherited();

	// remove status effects
scr_status_effect_retract( id );

ds_grid_destroy(status_effect_out);
ds_grid_destroy(status_effect_in);

