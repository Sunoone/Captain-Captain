/// @description scr_status_effect_check( object_id, index* )
/// @param object_id
/// @param index* 

// This script check all status effects for validity on the given object id
// index* is an optional argument that specifies an unique status_effect_in index to check


with( argument[0] )
{
	var m = 0;
	if( argument_count > 1 )
		m = argument[1] -1;
	
	for( var i = ds_grid_width(status_effect_in) -1; i>m; i-- )
	{
		if( argument_count > 1 )
			i = argument[1];
		
		var o = status_effect_in[# i, 2]; // origin
		
		if( instance_exists( o ) )
		{
			if( o.active )
			{
				
				if( status_effect_in[# i, 0] == scr_object_apparent_owner_get( id, original_owner ) )
				{
					if( status_effect_in[# i, 0] == scr_object_apparent_owner_get( o, original_owner ) )
					{
						switch( status_effect_in[# i,10] ) // status effect origin type
						{
							case 0:	// root
								if( root == o )
									continue;
							break;
						
							case 1:	// core
								if( scr_core_connected( o ) )
									continue;
		
							case 2:	// global
								continue; // not implemented yet
			
							case 3:	// child
								if( ds_list_find_index( owned_childern, o ) != -1 )
									continue;
							break;
							
							case 4:	// root or child
								if( ds_list_find_index( owned_childern, o ) != -1 || root == o )
									continue;
							break;
							
							case 5:	// root or child or self
								if( ds_list_find_index( owned_childern, o ) != -1 || root == o || id == o )
									continue;
							break;
							
							case 6:	// self
								if( id == o )
									continue;
							break;
			
							default: // object
								if( instance_exists( status_effect_in[# i,10] ) )
									continue;
							break;
						}
					}
				}
			}
		}
		
		// remove status effect
		scr_status_effect_remove_in( argument[0], status_effect_in[# i, 1], i );
	}
}
