/// @description scr_status_effect_request( id_in, id_out, type )
/// @param id_in
/// @param id_out
/// @param type

// this script requests an object for out status effects for the target

with( argument1 )
{
	for( var i = ds_grid_width(status_effect_out)-1; i>0; i-- )
	{
		// check for type
		if( status_effect_out[# i,0] != argument2 ) continue;
		
		// check filter
		if( !scr_id_check_parentage( argument0, status_effect_out[# i,4] ) ) continue;
		
		// check id
		if( scr_ds_grid_find_value_width( status_effect_in, status_effect_out[# i,1], 1 ) == -1 )
		{
			// add status effect
			scr_status_effect_set( argument0, argument1, status_effect_out[# i,1] );
		}
	}
}