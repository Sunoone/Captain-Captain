/// @description Hack Target

// maintain target list
for( var i = ds_list_size( target_id ) - 1; i >= 0; i-- )
{

	if( instance_exists( target_id[|i] ) )
	{	
		if( target_id[|i].owner == owner )
		{
			ds_list_delete( target_id, i );
		}
		else if( target_id[|i].owner < 0 && target_id[|i].original_owner != owner )
		{
			ds_list_delete( target_id, i );
		}	
	}
	else
	{
		ds_list_delete( target_id, i );
	}

}

var s = ds_list_size( target_id );
if( s > 0 )
	{
		var size;
		size = ds_list_size(owned_childern)

		if( size>0 )
		{
			for( var i = 0; i<size; i++ )
			{
				if( instance_exists( owned_childern[|i] ) )
				{			
					if(active)
					{
						owned_childern[|i].target_id = target_id[| i mod s ];
					}
				}
			}
		}
	}