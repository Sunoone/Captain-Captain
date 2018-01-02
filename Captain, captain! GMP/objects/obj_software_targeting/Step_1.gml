/// @description update childeren
// 

/*
var size;

size = ds_list_size(children)

if( size>0 )
{
	for( var i = 0; i<size; i++ )
	{
		if( instance_exists( children[|i] ) )
		{
			if( scr_obj_check_parentage( children[|i], obj_turret_1 ) )
			{
				with( children[|i] )
				{			
					if(active)
					{
						globalvar combat_screen_index;
					
						// aim the turret at the mouse
						direction = point_direction( 
									x, 
									y, 
									mouse_x - scr_screen_surface_get_x(combat_screen_index), 
									mouse_y - scr_screen_surface_get_y(combat_screen_index) );
					}
				}
			}
		}
	}
}
