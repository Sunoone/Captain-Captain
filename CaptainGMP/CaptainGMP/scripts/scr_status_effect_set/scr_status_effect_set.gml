/// @description scr_status_effect_set( object_id, origin, id )
/// @param object_id
/// @param origin
/// @param id

// This script adds a status effect to an object

var s = scr_ds_grid_find_value_width( argument1.status_effect_out, argument2, 1 )

with( argument0 )
{
	var w = ds_grid_width(status_effect_in);
	ds_grid_resize( status_effect_in, w + 1, 8 );
	
	status_effect_in[# w, 0] = scr_object_apparent_owner_get( argument1, original_owner );	// owner
	status_effect_in[# w, 1] = argument2;	// id
	status_effect_in[# w, 2] = argument1;	// origin
	status_effect_in[# w, 3] = argument1.status_effect_out[# s, 2];	// value
	status_effect_in[# w, 4] = argument1.status_effect_out[# s, 3]; // stat index
	status_effect_in[# w, 5] = scr_stat_add( argument0, status_effect_in[ w, 4], status_effect_in[ w, 3], argument1.status_effect_out[# s, 5] ); // stat height
	status_effect_in[# w, 6] = argument1.status_effect_out[# s, 6];	// name
	status_effect_in[# w, 7] = argument1.status_effect_out[# s, 7];	// icon
	status_effect_in[# w, 8] = argument1.status_effect_out[# s, 8];	// cost
}