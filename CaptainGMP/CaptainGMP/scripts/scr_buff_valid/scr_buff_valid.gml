/// @description scr_buff_valid( object_id, buff )

/// @param object_id
/// @param buff

// this script checks if the buff is valid on the given object


with(global.data)
{
	var buff_index = argument1;
	if( is_string( argument1 ) )
		buff_index = ds_map_find_value( data_buff_index, string_lower( argument1 ) );
	
		// check buff filter
	if( scr_id_check_parentage( argument0, data_buff[buff_index,3] ) )

		// check buff id
	if( !scr_ds_grid_find_value_width( argument0.Buff, data_buff[buff_index,4], 2 ) )
		return true;

}
return false;