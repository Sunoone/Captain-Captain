/// @description scr_screen_mouse_above( screen_index )
/// @param screen_index

// this script returns true if the mouse is above the given screen

var s_x, s_y, s_w, s_h, s_id;
s_x = scr_screen_surface_get_x( argument0 );

// the layers of if statements are made because of a small preformance increase
if( mouse_x >= s_x )
{
	s_y = scr_screen_surface_get_y( argument0 );
	
	if( mouse_y >= s_y )
	{
		s_id = scr_screen_surface_get_id( argument0 );
		s_w = surface_get_width( s_id );
		
		if( mouse_x < s_x + s_w )
		{
			s_h = surface_get_height( s_id );
			
			if( mouse_y < s_y + s_h )
			{
				return true;
			}
		}
	}
}

return false;