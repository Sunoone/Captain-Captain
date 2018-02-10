/// @description fire childeren
// 

if( global.player == owner )
{
	if( scr_screen_mouse_above( global.combat_screen_index ) )
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
						if(active)
						{					
							// fire the child
							fire = true;
						}
					}
				}
			}
		}
	}
}

