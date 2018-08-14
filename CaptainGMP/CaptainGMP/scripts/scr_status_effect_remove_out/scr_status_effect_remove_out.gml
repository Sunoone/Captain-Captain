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
	
	switch( target ) // remove status effect from target (update status effects)
	{
		case 0:	// childern
		{
			var filter = status_effect_out[# stw, 4];
			for( var c = ds_list_size( owned_childern ) -1; c>=0; c-- )
			{
				if( !object_exists( filter ) || scr_id_check_parentage( owned_childern[| c], filter ) )
				{
					owned_childern[| c].update_status_effects = true;
				}
			}
		}
		break;
		
		case 1:	// core
		if( instance_exists( core ) )
		{
			core.update_status_effects = true;
		}
		break;
		
		case 2:	// global
		break; // not implemented yet
			
		case 3:	// root
		if( instance_exists( root ) )
		{
			root.update_status_effects = true;
		}
		break;
		
		default: // object?
		if( object_exists( target ) )
		{
			target.update_status_effects = true;
		}	
		break;
	}
	
	scr_ds_grid_delete_row( status_effect_out, stw );
}








