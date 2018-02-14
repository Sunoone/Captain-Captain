/// @description switch mode

switch( access )
{
	
	case 1:
	{
		// get mouse position relative to the screen
		var m_x, m_y;
		m_x = scr_screen_mouse_get_x( screen_index );
		m_y = scr_screen_mouse_get_y( screen_index );
	
		var node = scr_interface_get_node( id, m_x, m_y );
	
		if( instance_exists( node ) )
		{
			if( variable_instance_exists( node, "mode" ) )
			{
				if( node.mode == 0 )
				{
					node.mode = 1;
					
				}
				else
				{
					node.mode = 0;
				}
					
				audio_play_sound( snd_interface_ping, 3, false );
				
				/*
				var grid, t, p;
				
				t = scr_interface_get_type( index, m_x, m_y );
				grid = ring[t,0];
				
				p = ds_grid_value_x( grid, 0, e_id, grid_width-1, e_id, node );
				
				if( p >= 0 )
				{
					if( node.mode == 0 )
						grid[# p, e_spr] = node.sprite_mode_0; // update sprite
					else
						grid[# p, e_spr] = node.sprite_mode_1; // update sprite
				}
				*/
				
				
			}
		}
	}
	break;

}