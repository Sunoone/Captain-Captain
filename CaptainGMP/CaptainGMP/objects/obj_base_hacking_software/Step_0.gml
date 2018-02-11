/// @description Attack Targets

// add targets to childern
var size = ds_list_size( owned_childern );
var tar = ds_list_size( target_id );

if( size > 0 )
{
	if( ds_list_size( target_id ) > 0 ) // attack hacked targets
	{		
		for( var i = 0; i < size; i++ )
		{
			ds_list_clear( owned_childern[|i].target_id );
			
			if( tar > 0 )
			{
				var pos = i mod min(size, tar);
				ds_list_add( owned_childern[|i].target_id, target_id[| pos ] );
			}
		}
	}
}
