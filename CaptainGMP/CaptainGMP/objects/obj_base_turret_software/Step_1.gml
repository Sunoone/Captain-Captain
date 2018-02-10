/// @description set target for owned children
// Overwrite me!

if( global.player == owner )
{
	// make globals local
	var combat_screen, combat_screen_index;
	combat_screen = global.combat_screen;
	combat_screen_index = global.combat_screen_index;

	var size, aim, c_x, c_y, c_w, c_h;

	c_x = scr_screen_surface_get_x(combat_screen_index);
	c_y = scr_screen_surface_get_y(combat_screen_index);

	if( mouse_x >= c_x && mouse_y >= c_y )
	{
		c_w = surface_get_width(combat_screen);
		c_h = surface_get_height(combat_screen);
	
		if( mouse_x <= c_x + c_w && mouse_y <= c_y + c_h)
		{
	
			fire_target_x = mouse_x - scr_screen_surface_get_x(combat_screen_index);
			fire_target_y = mouse_y - scr_screen_surface_get_y(combat_screen_index);
	
			size = ds_list_size(owned_childern)
			if( size>0 )
			{
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
}