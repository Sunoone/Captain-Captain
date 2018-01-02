/// @description update screen
// We draw the interface elements in a circulair interface here


// draw cicles
surface_set_target( screen_id );

draw_circle_color( s_width, s_height, rad_0, c_blue, c_blue, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist, c_aqua, c_aqua, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist*2, c_ltgray, c_ltgray, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist*3, c_dkgray, c_dkgray, false );


// draw links
for( var i = 0; i<max_rings; i++)
{
	var l_size = ds_list_size( ring[i,1] );
	for( var j = 0; j<l_size; j++ )
	{
		if( instance_exists( ds_list_find_value( ring[i,5], j ) ) )
		{
			var x1, x2, y1, y2;
			x1 =  ds_list_find_value( ring[i,6], j );
			y1 =  ds_list_find_value( ring[i,7], j );
			x2 =  ds_list_find_value( ring[i,8], j );
			y2 =  ds_list_find_value( ring[i,9], j );
			
			draw_line_width_color( x1, y1, x2, y2, 3, c_white, c_white );
		}
	}
}


// draw connection line
if( instance_exists(select_id) )
{
	//debug_size = ds_list_size(select_id.children);
	
	var ls_x, ls_y;
	
	ls_x = ds_list_find_value( ring[select_ring,6], select_pos);
	ls_y = ds_list_find_value( ring[select_ring,7], select_pos);
	
	draw_line_width_color( mouse_x - f_x, mouse_y - f_y, ls_x, ls_y, 3, c_yellow, c_yellow );
}



// draw interface icons
for( var i = 0; i<max_rings; i++)
{
	var p_len, l_size;
	
	l_size = ds_list_size( ring[i,1] );
	
	//debug
	//draw_text_colour( 10, 10 + 20 * i, "Ring " + string(i) + " size: " + string( l_size ) , c_red,c_red,c_red,c_red,1);
	
	if( l_size > 0 )
	{
		p_len = (rad_0*0.5) - (r_dist*0.5) + (r_dist*i); // distance from the center based on the ring number
		
		for( var j = 0; j<l_size; j++ )
		{
			var e_spr, e_rot, e_x, e_y, e_id;
			
			e_id =  ds_list_find_value( ring[i,1], j ); // object id
			
			if( instance_exists( e_id ) )
			{
				e_x = ds_list_find_value( ring[i,6], j ); // element x
				e_y = ds_list_find_value( ring[i,7], j ); // element y
				e_spr = ds_list_find_value( ring[i,4], j ); // element sprite
				
				draw_sprite( spr_baseNode, 0, e_x, e_y);
				draw_sprite( e_spr, 0, e_x, e_y );		
			}
			else
			{
				// reference does no longer exist, remove from list
				var r_length = array_length_2d(ring, i);
				for( var c = 0; c<r_length; c++ )
				{
					if( ds_exists( ring[i,c], ds_type_list ) )
					{
						ds_list_delete( ring[i,c], j );
					}
				}
				
				j--;
				l_size--;
			}
			
		}
	}
}

surface_reset_target();