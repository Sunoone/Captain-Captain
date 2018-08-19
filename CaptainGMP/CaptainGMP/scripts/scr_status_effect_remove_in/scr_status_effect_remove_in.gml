/// @description scr_status_effect_remove_in( object_id, status_effect_id, status_effect_index* )
/// @param object_id
/// @param status_effect_id
/// @param status_effect_index*

// This script removes the in status effect based on the given id
// status_effect_index* is an optional parameter that can be passed to make this script run faster (bypasses the id lookup)

with( argument[0] )
{
	var stw; 
	
	if( argument_count < 3 )
		stw = scr_ds_grid_find_value_width( status_effect_in, argument[1], 1 );
	else
		stw = argument[2];
	
	if( stw >= 0 && stw < ds_grid_width( status_effect_in ) )
	{
		// remove from stat array
		scr_stat_remove( argument[0], status_effect_in[# stw, 4], status_effect_in[# stw, 9], status_effect_in[# stw, 11] );
		
		// remove from status_effect_in
		scr_ds_grid_delete_column( status_effect_in, stw );
	}
}








