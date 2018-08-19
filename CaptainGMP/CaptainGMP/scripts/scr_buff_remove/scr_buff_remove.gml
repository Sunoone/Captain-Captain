/// @description scr_buff_remove( object_id, buff_index )

/// @param object_id
/// @param buff_index

with( argument0 )
{
	var buff_index = argument1;
	if( is_string(buff_index) )
		buff_index = scr_ds_grid_find_value_width( Buff, string_lower( buff_index ), 0 );
	
	scr_status_effect_remove_out( argument0, Buff[# buff_index, 4 ] );
	scr_ds_grid_delete_column( Buff, buff_index );
}