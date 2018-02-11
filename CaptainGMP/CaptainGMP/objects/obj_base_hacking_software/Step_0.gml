/// @description Attack Targets

// add targets to childern
size = ds_list_size( owned_childern );
if( size > 0 )
{
	if( ds_list_size( target_id ) > 0 ) // attack hacked targets
	{		
		for( var i = 0; i < size; i++ )
		{
			ds_list_clear( owned_childern[|i].target_id );
			
			if( switch_active )
				ds_list_add( owned_childern[|i].target_id, target_id[| i mod size ] );
		}
	}
}
