/// @description scr_buff_load( buff_name, status_effect_name, default_time, filter, buff_type )

/// @param buff_name
/// @param status_effect_name
/// @param default_time
/// @param filter
/// @param buff_type

// this script loads a buff in global.data

with( global.data )
{
	var i = array_height_2d(data_buff);
	ds_map_add( data_buff_index, string_lower( argument0 ), i );
	
	data_buff[i,0] = argument0; // buff name
	data_buff[i,1] = argument1; // status effect name
	data_buff[i,2] = argument2; // default time
	data_buff[i,3] = argument3; // buff filter
	data_buff[i,4] = get_timer(); // buff id
	data_buff[i,5] = argument4; // buff type, 0 = friendly, 1 = enemy, 2 = both
}