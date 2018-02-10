/// @description stop firing childeren
// 

if( global.player == owner )
{
	var size;

	size = ds_list_size(owned_childern)

	if( size>0 )
	{
		for( var i = 0; i<size; i++ )
		{
			if( instance_exists( owned_childern[|i] ) )
			{
				with( owned_childern[|i] )
				{			
					// stop fire on the child
					fire = false;
				}
			}
		}
	}
}