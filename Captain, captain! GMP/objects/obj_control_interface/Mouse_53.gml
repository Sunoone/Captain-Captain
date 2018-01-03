/// @description Search for interface elements
// Does the mouse click on an interface element?

/*
if( mouse_x > f_x && mouse_x < f_x + f_width && mouse_y > f_y && mouse_y < f_y + f_height)
{
	select_id = -4;
	select_ring = -4;
	select_pos = -4;
	
	var m_x, m_y, m_dist;
	m_x = mouse_x - f_x;
	m_y = mouse_y - f_y;
	
	// distance the mouse is from the center of the interface
	m_dist = point_distance(s_width, s_height, m_x, m_y);
	
	// if the mouse is within the interface
	if( m_dist < rad_0 )
	{
		var i, r;
		r = rad_0 - r_dist * max_rings;
		
		if( m_dist > r )
		{
			// i == ring number where the mouse clicked
			i = floor( (m_dist - r) / r_dist );
			
			if( i >= 0 && i < max_rings )
			{
				var l_size = ds_list_size(ring[i,1]);
				
				for( var j = 0; j<l_size; j++ )
				{
					var e_x, e_y;
					e_x = ds_list_find_value( ring[i,6], j );
					e_y = ds_list_find_value( ring[i,7], j );
					
					if( point_distance( m_x, m_y, e_x, e_y ) < r_dist * 0.5 )
					{
						select_id = ds_list_find_value( ring[i,1], j );
						select_ring = i;
						select_pos = j;
						break;
					}
					else
					{
						
					}
				}
			}
		}
	}
	
}
