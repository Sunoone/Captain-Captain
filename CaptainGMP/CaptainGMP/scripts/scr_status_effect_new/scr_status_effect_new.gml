/// @description scr_status_effect_new( object_id, target, stat, use_core_stat, filter, value )
/// @param object_id
/// @param target
/// @param stat
/// @param use_core_stat
/// @param filter
/// @param value

// This script creates a new status effect that the object sends out to valid targets

var gw;

with( argument0 )
{
	gw = ds_grid_width( status_effect_out );
	ds_grid_resize( status_effect_out, gw+1, 6 );
	
	status_effect_out[# gw, 0] = argument1;		// 0 = target ( 0 = childern, 1 = core, 2 = global)
	status_effect_out[# gw, 1] = get_timer();	// 1 = id
	status_effect_out[# gw, 2] = argument5;		// 2 = value
	status_effect_out[# gw, 3] = argument2;		// 3 = stat index
	status_effect_out[# gw, 4] = argument4;		// 4 = filter (filter on inherited objects)
	status_effect_out[# gw, 5] = argument3;		// 5 = use core stats (bool)
}








