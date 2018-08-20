/// @desciption scr_status_effect_load( name, icon, target, stat, value, percentage, filter, cost, invisible )
/// @param name
/// @param icon
/// @param target
/// @param stat
/// @param value
/// @param percentage
/// @param filter
/// @param cost
/// @param invisible

// this script loads a status effect into global.data

with( global.data )
{
	var i = array_height_2d(data_status_effect);
	ds_map_add( data_status_effect_index, string_lower( argument0 ), i );
	
	data_status_effect[i,0] = argument0;	// name
	data_status_effect[i,1] = argument1;	// icon
	data_status_effect[i,2] = argument2;	// target
	data_status_effect[i,3] = argument3;	// stat
	data_status_effect[i,4] = argument4;	// value
	data_status_effect[i,5] = argument5;	// percentage
	data_status_effect[i,6] = argument6;	// filter
	data_status_effect[i,7] = argument7;	// cost
	data_status_effect[i,8] = get_timer();	// id
	data_status_effect[i,9] = argument8;	// invisible to interface
}