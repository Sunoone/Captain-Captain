/// @description scr_buff_valid( object_id, buff, owner )

/// @param object_id
/// @param buff
/// @param owner

// this script checks if the buff is valid on the given object


with(global.data)
{
	var buff_index = argument1;
	if( is_string( argument1 ) )
		buff_index = ds_map_find_value( data_buff_index, string_lower( argument1 ) );
	
		// check buff index
	if( buff_index >= 0 && buff_index < array_height_2d(data_buff) )
	
		// check object
	if( instance_exists(argument0) )
		
		// check buff filter
	if( scr_id_check_parentage( argument0, data_buff[buff_index,3] ) )
	
		// check buff id
	if( !scr_ds_grid_find_value_width( argument0.Buff, data_buff[buff_index,4], 2 ) )
		
	switch( data_buff[buff_index,5] )
	{
		case 0: // friendly only
			if( argument0.owner == argument2 )
				return true;
		break;
		
		case 1: // enemy only
			if( argument0.owner != argument2 )
				return true;
		break;
		
		case 2: // both
			return true;
		
		default: 	
		break;
	}
		

}
return false;