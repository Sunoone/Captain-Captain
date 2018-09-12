/// @description DEBUG shield collision


if( shield > 0 && scr_screen_mouse_above( global.combat_screen_index ) )
{
	// get the mouse co-ordinates on screen
	var m_x, m_y;
	m_x = scr_camera_get_mouse_x( global.combat_camera );
	m_y = scr_camera_get_mouse_y( global.combat_camera );
	
	// collision
	var radius, col;
	
	radius = 25;
	col = scr_shield_check_collision( id, m_x, m_y, radius );
	
	if( col > 0 )
	{
		var len, dir;
		
		dir = point_direction( x,y,m_x,m_y ) - direction;
		len = point_distance( x,y,m_x,m_y );
		
		m_x = lengthdir_x(len,dir);
		m_y = lengthdir_y(len,dir);
		
		surface_set_target(Shield_mask_surface);
		
		var c_x, c_y;
		c_x = surface_get_width( Shield_mask_surface ) * 0.5;
		c_y = surface_get_height( Shield_mask_surface ) * 0.5;
		
		//draw_clear(c_white);
		draw_circle_color( c_x + m_x, c_y + m_y, radius, c_white, c_white, false );
		
		surface_reset_target();
	}
	
}
 