/// @description scr_status_effect_push( object_id, index* )
/// @param object_id
/// @param index*

// This script (re)applies all status effects that the object grants

with( argument[0] )
{
		// do not push status effects if object is not active
	if( argument[0].active == false )
		exit;
	
	var target, target_list, bufftarget;
	target_list = ds_list_create();
	
	var m = 0;
	if( argument_count > 1 ) m = argument[1]-1;
	
	for( var i = ds_grid_width(status_effect_out)-1; i>m; i-- )
	{
		if( argument_count > 1 ) i = argument[1];
		
		target = status_effect_out[# i, 0 ];
		
		switch( target ) // remove status effect from target
		{
			case 0:	// childern
			{	
				ds_list_copy( target_list, children );
			}
			break;
		
			case 1:	// core
			{
				if( scr_core_connected( argument[0] ) )
					ds_list_add( target_list, core );
			}
			break;
		
			case 2:	// global
			{
				// not implemented yet, take ship as a global repository?
			}
			break;
			
			case 3:	// root
			{
				ds_list_add( target_list, root );
			}
			break;
			
			case 4:	// all linked
			{
				ds_list_copy( target_list, children );
				ds_list_add( target_list, root );
			}
			break;
			
			case 5:	// all linked, including self
			{
				ds_list_copy( target_list, children );
				ds_list_add( target_list, root );
				ds_list_add( target_list, id );
			}
			break;
			
			case 6:	// self
			{
				ds_list_add( target_list, id );
			}
			break;
			
			default: // object
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
			if( !instance_exists( status_effect_out[# i, 4] ) || scr_id_check_parentage( bufftarget, status_effect_out[# i, 4] ) )
			{
				// check id
				if( scr_ds_grid_find_value_width( bufftarget.status_effect_in, status_effect_out[# i, 1], 1 ) != -1 ) continue;
				
				// check owner
				if( argument[0].owner == bufftarget.owner )
				{
					// add status effect
					scr_status_effect_set( bufftarget, argument[0], status_effect_out[# i,1] );
				}
			}
		}
		ds_list_clear(target_list);
	}
	ds_list_destroy(target_list);
}