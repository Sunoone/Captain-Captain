/// @description Node Menu

scr_screen_surface_set_active( menu_screen_index, false );
draw_menu = false;

if( scr_screen_mouse_above(screen_index) )
{
	// get mouse position relative to the screen
	var m_x, m_y;
	m_x = scr_screen_mouse_get_x( screen_index );
	m_y = scr_screen_mouse_get_y( screen_index );
	
	var node, node_pos, node_type;
	node = scr_interface_get_node( id, m_x, m_y );
	node_pos = scr_interface_get_pos( index, m_x, m_y );
	node_type = scr_interface_get_type( index, m_x, m_y );
	
	if( instance_exists( node ) )
	{
		var grid = ring[node_type,0];
		
		switch( access )
		{
			case 0: // Hostile interface
			{
				if( node.secret_owner == global.player )
				{
					ds_list_clear( menu_options_graphics );
					
					ds_list_add( menu_options_graphics, spr_action_disrupt, spr_action_stealth, spr_action_fortify, spr_action_command );
					
					ds_list_add( menu_options_list, 0, 1, 2, 3 );
					
					draw_menu = true;
					
					scr_screen_surface_set_active( menu_screen_index, draw_menu );
					
					menu_id = node;
					menu_x = grid[# node_pos, e_x] + f_x - 78;
					menu_y = grid[# node_pos, e_y] + f_y - 78;
					
					scr_screen_surface_set_xy( menu_screen_index, menu_x, menu_y );
					
					audio_play_sound( snd_interface_ping, 3, false );
				}
			}
			break;
	
			case 1: // Friendly interface
			{
				
				// switch mode
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
				}
				
			}
			break;

		}
	}
}