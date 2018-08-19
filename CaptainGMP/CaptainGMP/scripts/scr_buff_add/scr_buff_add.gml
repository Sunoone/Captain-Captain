/// @description scr_buff_add( object_id, buff, time*, cost* )

/// @param object_id
/// @param buff
/// @param time*
/// @param cost*


// this script adds a buff to an object

with( global.data )
{
	var key, i, obj;
	
	key = string_lower( argument[1] );
	if( ds_map_exists( data_buff_index, key ) )
		 i = ds_map_find_value( data_buff_index, key )
	else show_error( "Unable to find status effect '" + key + "' in global.data.data_buff_index.", true ) ;
	
	obj = argument[0];
	
	if( scr_buff_valid( obj, i ) )
	{
		// add buff to object
		
			// create new column
		var b, time;
		b = scr_ds_grid_add_column( obj.Buff );
		
			// get time
		if( argument_count > 2 )
			time = argument[2];
		else
			time = data_buff[i,2];
		
		obj.Buff[# b, 0] = string_lower( data_buff[i,0] );	// name	
		obj.Buff[# b, 1] = data_buff[i,1];	// status effect
		obj.Buff[# b, 2] = data_buff[i,4];	// buff id
		obj.Buff[# b, 3] = time;			// time
		
			// add status effect to obj
		obj.Buff[# b, 4] = scr_status_effect_add( obj, data_buff[i,1], data_buff[i,4] ); // status effect id		
		
		// extra info to status effect		
			// set custom cost
		if( argument_count > 3 )
		{
			var s = scr_ds_grid_find_value_width( obj.status_effect_out, obj.Buff[# b, 4], 1 );
			obj.status_effect_out[# s,8] = argument[3];
		}
	}
}