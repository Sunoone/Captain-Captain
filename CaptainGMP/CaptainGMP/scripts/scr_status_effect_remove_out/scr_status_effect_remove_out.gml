/// @description scr_status_effect_remove_out( object_id, status_effect_id )
/// @param object_id
/// @param status_effect_id

// This script removes the out status effect based on the given id

with( argument0 )
{
	var stw, target; 
	
	stw = scr_ds_grid_find_value_width( status_effect_out, argument1, 1 );	
	if( stw == -1 ) exit;
	
	target =  status_effect_out[# stw, 0 ];
	
	switch( target ) // remove status effect from target
	{
		case 0:	// childern
			break;
		
		case 1:	// core
			break;
		
		case 2:	// global
			break;
		
		default: // object?
		if( object_exists( target ) )
		{
			
		}	
		break;
	}
	
	scr_ds_grid_delete_row( status_effect_out, stw );
}








