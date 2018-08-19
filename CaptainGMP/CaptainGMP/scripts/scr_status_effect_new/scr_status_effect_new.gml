/// @description scr_status_effect_new( object_id, target, stat, filter, value, name, icon, cost, is_percentage, id*, buff_id* )
/// @param object_id
/// @param target
/// @param stat
/// @param filter
/// @param value
/// @param name
/// @param icon
/// @param cost
/// @param is_percentage
/// @param id*
/// @param buff_id*

// This script creates a new status effect that the object sends out to valid targets

var gw;

with( argument[0] )
{
	gw = scr_ds_grid_add_column(status_effect_out);
	
	var se_id;
	if( argument_count>9 ) se_id = argument[9];
	else se_id = get_timer();
	
	var buff_id;
	if( argument_count>10 ) buff_id = argument[10];
	else buff_id = -1;
	
	status_effect_out[# gw, 0] = argument[1];		// 0 = target ( 0 = childern, 1 = core, 2 = global, 3 = root, object_id)
	status_effect_out[# gw, 1] = se_id;				// 1 = status effect id
	status_effect_out[# gw, 2] = argument[4];		// 2 = value
	status_effect_out[# gw, 3] = argument[2];		// 3 = stat index
	status_effect_out[# gw, 4] = argument[3];		// 4 = filter (filter on inherited objects)
	status_effect_out[# gw, 5] = buff_id;			// 5 = buff id (used if status effect is from buff)
	status_effect_out[# gw, 6] = argument[5];		// 6 = name
	status_effect_out[# gw, 7] = argument[6];		// 7 = icon
	status_effect_out[# gw, 8] = argument[7];		// 8 = cost
	status_effect_out[# gw, 9] = argument[8];		// 9 = is_percentage
}

// call push fuction
scr_status_effect_push( argument[0], gw );
