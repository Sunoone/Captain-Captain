/// @description scr_status_effect_retract( object_id, index* )
/// @param object_id
/// @param index*

// This script retracts a specific or all status effects that the object grants

with( argument[0] )
{
	if( !ds_exists( status_effect_out, ds_type_grid ) ) exit;
	
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
				if( ds_exists( children, ds_type_list ) )
					ds_list_copy( target_list, children );
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
			
			case 3:	// root
			{
				ds_list_add( target_list, root );
			}
			break;
			
			case 4:	// all linked
			{
				if( ds_exists( children, ds_type_list ) )
					ds_list_copy( target_list, children );
				
				ds_list_add( target_list, root );
			}
			break;
			
			case 5:	// all linked, including self
			{
				if( ds_exists( children, ds_type_list ) )
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
			
				// check if the target exists
			if( !instance_exists(bufftarget) ) continue;
			
				// check if the buff is applied
			var w = scr_ds_grid_find_value_width( bufftarget.status_effect_in, status_effect_out[# i, 1], 1 );
			
			if( w == -1 ) 
				continue;
			
				// remove the status effect
			scr_status_effect_remove_in( bufftarget, status_effect_out[# i, 1], w );
			
			bufftarget.update_status_effects = true;
		}
		ds_list_clear(target_list);
	}
	ds_list_destroy(target_list);
}