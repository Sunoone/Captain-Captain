/// @description scr_interface_get_node( interface_id, x, y )
/// @param interface_id
/// @param x
/// @param y

// this script returns the pos of under the x and y in the given interface
// x and y arguments hould be passed relative to the interface screen

var m_x, m_y;

m_x = argument1;
m_y = argument2;

with( argument0 )
{
	if( scr_screen_mouse_above( screen_index ) )
	{
		var grid, hold;	
		hold = false;
	
		// this can be replaced by some math that figures out to which position the mouse is closest
		for( var i = 0; i < max_rings; i++ )
		{
			grid = ring[i,0];
		
			for( var j = 0; j < grid_width; j++ )
			{
				if( instance_exists( grid[# j, e_id ] ) && grid[# j, e_visible ] >= 0 )
				{
					// if statement has a HARDCODED distance, the radius of an interface element
					if( point_distance( m_x, m_y, grid[# j,e_x], grid[# j,e_y] ) <= 25 )
					{
						return( grid[# j, e_id ] );
					}
				}
			}
			if(hold) break;
		}
	}
}

return -4;