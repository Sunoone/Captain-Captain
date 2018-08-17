/// @description scr_status_effect_request( id_in, id_out )
/// @param id_in
/// @param id_out

// this script requests an object for out status effects for the target

if( !argument1.active )
	exit;

with( argument1 )
{
	for( var i = ds_grid_width(status_effect_out)-1; i>0; i-- )
	{
		if( scr_status_effect_valid( argument1, argument0, i ) )
		{
			// add status effect
			scr_status_effect_set( argument0, argument1, status_effect_out[# i,1] );
		}
	}
}