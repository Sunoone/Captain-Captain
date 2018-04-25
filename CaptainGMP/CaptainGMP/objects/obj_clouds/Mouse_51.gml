/// @description debug options

if( debug_enabled )
{
	var m_x, m_y;
	
	m_x = mouse_x;
	m_y = mouse_y;
	
	if( screen_index != -4 )
	{
		m_x = scr_screen_mouse_get_x( screen_index );
		m_y = scr_screen_mouse_get_y( screen_index );
	}
	
	if( m_x > d_x1 + 10 &&  m_x < d_x1 + 90 && m_y > d_y1 + 10 &&  m_y < d_y1 + 90 )	
	{
		light_direction[0] = ( m_x - d_x1 - 10 ) / 80;
		light_direction[1] = ( m_y - d_y1 - 10 ) / 80;
		light_direction[2] = 1.0 - max( light_direction[0], light_direction[1] ) * 0.5;
	}
	
	if( m_x > d_x1 - 40 &&  m_x < d_x1 - 10 && m_y > d_y1 &&  m_y < d_y2 )	
	{
		d_kelvin = ( ( m_y - d_y1 ) / 100 ) * 4000 + 4000;
		light_colour = scr_kelvin2rgb( d_kelvin );
	}
	
}

