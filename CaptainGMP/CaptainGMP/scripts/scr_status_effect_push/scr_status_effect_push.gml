/// @description scr_status_effect_push( object_id )
/// @param object_id

// This script (re)applies all status effects that the object grants

// this script needs to be changed so that a specific (just added) status effect can be pushed

with( argument0 )
{
	var target, target_list, bufftarget;
	
	target_list = ds_list_create();
	
	for( var i = ds_grid_width(status_effect_out)-1; i>0; i-- )
	{
		target = status_effect_out[# i, 0 ];
		
		switch( target ) // remove status effect from target
		{
			case 0:	// childern
			{	
				ds_list_copy( target_list, owned_childern );
			}
			break;
		
			case 1:	// core
			{
				ds_list_add( target_list, core );				
			}
			break;
		
			case 2:	// global
			{
				// not implemented yet, take ship as a global repository?
			}
			break;
		
			default: // object?
			{
				ds_list_add( target_list, target );
			}
			break;
		}
		
		for( var t = ds_list_size( target_list )-1; t >= 0; t-- )
		{
			bufftarget = target_list[|t];
			
			if( !instance_exists(bufftarget) ) continue;
			
			// check if object fits filter
			if( !instance_exists( status_effect_out[# i, 4] ) || scr_object_check_parentage( bufftarget, status_effect_out[# i, 4] ) )
			{
				// check id
				if( scr_ds_grid_find_value_width( bufftarget.status_effect_in, status_effect_out[# i, 1], 1 ) != -1 ) continue;
				
				// check owner
				if( scr_object_apparent_owner_get( argument0, original_owner ) == scr_object_apparent_owner_get( bufftarget, bufftarget.original_owner ) )
				{
					// add status effect
					scr_status_effect_set( bufftarget, argument0, status_effect_out[# i,1] );
				}
			}
		}
		ds_list_clear(target_list);
	}
	
	ds_list_destroy(target_list);
}