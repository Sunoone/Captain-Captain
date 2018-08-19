/// @description scr_status_effect_new( object_id, target, stat, filter, value, name, icon, cost, is_percentage )
/// @param object_id
/// @param target
/// @param stat
/// @param filter
/// @param value
/// @param name
/// @param icon
/// @param cost
/// @param is_percentage

// This script creates a new status effect that the object sends out to valid targets

var gw;

with( argument0 )
{
	gw = scr_ds_grid_add_column(status_effect_out);
		
	status_effect_out[# gw, 0] = argument1;		// 0 = target ( 0 = childern, 1 = core, 2 = global, 3 = root, object_id)
	status_effect_out[# gw, 1] = get_timer();	// 1 = id
	status_effect_out[# gw, 2] = argument4;		// 2 = value
	status_effect_out[# gw, 3] = argument2;		// 3 = stat index
	status_effect_out[# gw, 4] = argument3;		// 4 = filter (filter on inherited objects)
	status_effect_out[# gw, 6] = argument5;		// 6 = name
	status_effect_out[# gw, 7] = argument6;		// 7 = icon
	status_effect_out[# gw, 8] = argument7;		// 8 = cost
	status_effect_out[# gw, 9] = argument8;		// 9 = is_percentage
}

// call push fuction
scr_status_effect_push( argument0, gw );
