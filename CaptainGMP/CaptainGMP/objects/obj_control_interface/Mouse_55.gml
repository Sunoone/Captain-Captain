/// @description Drag Element

// ini vars
var m_x, m_y
m_x = scr_screen_mouse_get_x( screen_index );
m_y = scr_screen_mouse_get_y( screen_index );

// de-select interface element
global.interface_select_id[index] = -1;

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
				// if statement has a HARDCODED distance, the radius of an interface element
			if( instance_exists( grid[# j, e_id ] ) )
			{
				if( point_distance( m_x, m_y, grid[# j,e_x], grid[# j,e_y] ) <= 25 )
				{
					global.interface_select_id[index] = grid[# j, e_id ];
					hold = true;
							
					audio_play_sound( snd_interface_ping, 3, false );
					
					break;
				}
			}
		}
		if(hold) break;
	}
}