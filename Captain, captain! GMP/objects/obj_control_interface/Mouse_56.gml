/// @description Link interface elements
// Does the mouse click on an interface element?

if( instance_exists(select_id))
{
	if( mouse_x > f_x && mouse_x < f_x + f_width && mouse_y > f_y && mouse_y < f_y + f_height)
	{		
		
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
							var select_id_2, select_ring_2, select_pos_2;
							
							if( i == select_ring) 
							{ 
								/* equal ring, not implemented */
								update = true;
								break;  
							}
							else if( i > select_ring )
							{
								select_id_2 = ds_list_find_value( ring[i,1], j ); // child object
								select_ring_2 = i;
								select_pos_2 = j;
							}
							else if( i < select_ring )
							{
								select_id_2 = select_id; // child object
								select_ring_2 = select_ring;
								select_pos_2 = select_pos;
								select_id = ds_list_find_value( ring[i,1], j ); // parent object
								select_ring = i;
								select_pos = j;
							}
							
							if( ds_list_size(select_id.children) < select_id.max_children && instance_exists(select_id_2) )
							{
									
									// Remove old link
								var old_parent = ds_list_find_value( ring[select_ring_2,5], select_pos_2 );
								
								if( instance_exists( old_parent ) )
								{
									var old_index = ds_list_find_index( old_parent.children, select_id_2 );
									if( old_index >= 0 ) 
									{
										ds_list_delete( old_parent.children, old_index );
									}
								}
									
									// Link Interface element to parent
								if( ds_list_find_index(select_id.children, select_id_2) == -1 )
								{
									ds_list_add(select_id.children, select_id_2);
								}
								
									
									// Set Parent info
								ds_list_set( ring[select_ring_2,5], select_pos_2, select_id ); // link id
								ds_list_set( ring[select_ring_2,8], select_pos_2, ds_list_find_value( ring[select_ring,6], select_pos) ); // link x
								ds_list_set( ring[select_ring_2,9], select_pos_2, ds_list_find_value( ring[select_ring,7], select_pos) ); // link y
								
									
									// Update position; move towards parent
								var p_rot = ds_list_find_value( ring[select_ring,2], select_pos ); // Parent Rotation
								var n_pos = p_rot div ( 360 / ring[select_ring_2,0] );
								
								for (var m = array_length_2d(ring, select_ring_2) -1; m > 0; m-- )
								{
									var list_info = ds_list_find_value( ring[select_ring_2, m], select_pos_2 );
									ds_list_delete( ring[select_ring_2, m], select_pos_2 );
									ds_list_insert( ring[select_ring_2, m], n_pos, list_info );
								}
								
								update = true;
							}
							
							break;
						}
					}
				}
			}
		}
	}
}

select_id = -4;
select_ring = -4;
select_pos = -4;