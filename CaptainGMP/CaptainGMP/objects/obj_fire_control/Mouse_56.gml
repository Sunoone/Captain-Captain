/// @description stop firing childeren
// 

if( global.player == owner )
{
	var size;

	size = ds_list_size(children)

	if( size>0 )
	{
		for( var i = 0; i<size; i++ )
		{
			if( instance_exists( children[|i] ) )
			{
				with( children[|i] )
				{			
					// stop fire on the child
					fire = false;
				}
			}
		}
	}
}