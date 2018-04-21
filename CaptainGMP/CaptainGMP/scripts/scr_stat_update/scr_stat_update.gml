/// @description scr_stat_update( obj )
/// @param obj

// This script updates the entire stat array

with( argument0 )
{
	for( var i = array_height_2d( stat ) -1; i >= 0; i-- )
	{
		scr_status_effect_update( id, i );
	}
}