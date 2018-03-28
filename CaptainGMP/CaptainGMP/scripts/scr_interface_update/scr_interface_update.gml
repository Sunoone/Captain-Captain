/// @description scr_interface_update()

// This script updates the interface elements

for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	for( var j = 0; j<grid_width; j++ )
	{
		var o = grid[# j, e_id ];
		var p = grid[# j, e_link ];
		
		if( instance_exists( o ) )
		{
			if( o.secret_owner != o.original_owner && grid[# j, e_visible ] < 1 ) // make hacked elements visible
			{
				grid[# j, e_visible ] = 1;
				if( i > 0 && instance_exists( p ) )
				{
					var grid_above = ring[i - 1, 0];
					var parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
					grid_above[# parent_index, e_visible ] = 0;
				}
				
				if( i < 2 )
				{
					var c_size, grid_below, child_index;
					c_size = ds_list_size( o.children );
					grid_below = ring[i + 1, 0];
					for( var c = 0; c < c_size; c++ )
					{
						var child = o.children[|c];
						if( instance_exists( child ))
						{
							child_index = ds_grid_value_x( grid_below, 0, e_id, grid_width - 1, e_id, child );
							
							if( grid_below[# child_index, e_visible ] < 0 )
							{
								grid_below[# child_index, e_visible ] = 0;
							}
						}
					}
				}
			}
			else if( ( o.has_been_revealed && grid[# j, e_visible ] < 0 ) ) // reveal childless objects
			{
				grid[# j, e_visible ] = 0;
			}
			
			if( instance_exists( p ) )	// draw links
			{
				var grid_above, parent_index, p_v, e_v;
				
				grid_above = ring[i - 1, 0];
				parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
				
				e_v = grid[# j, e_visible ];
				p_v = grid_above[# parent_index, e_visible ];
				
				if( e_v > 0 && p_v < 0 )
				{
					grid_above[# parent_index, e_visible ] = 0;
					p_v = 0;
				}
				
				if( p_v > 0 && e_v < 0 )
				{
					grid[# j, e_visible ] = 0;
					e_v = 0;
				}
			}
		}
	}
}