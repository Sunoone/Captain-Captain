/// @description scr_interface_draw_links()

// this script draws the links between the nodes

for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	for( var j = 0; j<grid_width; j++ )
	{
		var o = grid[# j, e_id ];
		var p = grid[# j, e_link ];
		
		if( instance_exists( o ) )
		{
			
			if( instance_exists( p ) )	// draw links
			{
				var grid_above, parent_index, p_v, e_v;
				
				grid_above = ring[i - 1, 0];
				parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
				
				e_v = grid[# j, e_visible ];
				p_v = grid_above[# parent_index, e_visible ];
								
				if( ( e_v > 0 && p_v >= 0 ) || ( p_v > 0 && e_v >= 0 ) )
				{
					var x1, x2, y1, y2;
					x1 =  grid[# j, e_x ];
					y1 =  grid[# j, e_y ];
				
					x2 =  grid_above[# parent_index, e_x ];
					y2 =  grid_above[# parent_index, e_y ];
			
					draw_line_width_color( x1, y1, x2, y2, 3, c_white, c_white );
				}
			}
		}
	}
}