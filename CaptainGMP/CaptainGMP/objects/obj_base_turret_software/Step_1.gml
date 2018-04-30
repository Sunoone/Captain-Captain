/// @description set target for owned children
// Overwrite me!

if( global.player == owner )
{
	if( scr_screen_mouse_above( global.combat_screen_index ) )
	{
		size = ds_list_size(owned_childern);
		if( size>0 )
		{
			fire_target_x = scr_camera_get_mouse_x( global.combat_camera );
			fire_target_y = scr_camera_get_mouse_y( global.combat_camera );
		
			for( var i = 0; i<size; i++ )
			{
				if( instance_exists( owned_childern[|i] ) )
				{		
					owned_childern[|i].target_x = fire_target_x;
					owned_childern[|i].target_y = fire_target_y;	
				}
			}
		}
	}
}