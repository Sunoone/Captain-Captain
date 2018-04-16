/// @description scr_interface_draw_links()

// this script draws the links between the nodes

var player_index, o, p, grid_above, parent_index, p_v, e_v, x1, x2, y1, y2, grid, col;

player_index = global.player;



for( var i = 0; i<max_rings; i++)
{
	grid = ring[i,0];
	
	for( var j = 0; j<grid_width; j++ )
	{
		o = grid[# j, e_id ];
		p = grid[# j, e_link ];
		
		if( instance_exists( o ) )
		{
			col = c_white;
			
			if( scr_object_apparent_owner_get( o, player_index ) != player_index ) 
				col = c_red;
			
			if( instance_exists( p ) )	// draw links
			{				
				grid_above = ring[i - 1, 0];
				parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
				
				e_v = grid[# j, e_visible ];
				p_v = grid_above[# parent_index, e_visible ];
				
				
				if( scr_object_apparent_owner_get( p, player_index ) != player_index )
					col = c_red;
				
				if( ( e_v > 0 && p_v >= 0 ) || ( p_v > 0 && e_v >= 0 ) )
				{
					x1 =  grid[# j, e_x ];
					y1 =  grid[# j, e_y ];
				
					x2 =  grid_above[# parent_index, e_x ];
					y2 =  grid_above[# parent_index, e_y ];
			
					draw_line_width_color( x1, y1, x2, y2, 3, col, col );
				}
			}
			else if( i ==  0 && grid[# j, e_visible ] == 1) // draw lines for software to core
				draw_line_width_color(  grid[# j, e_x ], grid[# j, e_y ], s_width, s_height, 3, col, col );
		}
	}
}