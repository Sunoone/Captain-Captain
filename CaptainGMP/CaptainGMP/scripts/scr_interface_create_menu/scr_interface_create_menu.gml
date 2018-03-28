/// @description scr_interface_create_menu()

// this script collects and loads all data needed to create a menu



// get mouse position relative to the screen
var m_x, m_y, node, node_pos, node_type, grid;
m_x = scr_screen_mouse_get_x( screen_index );
m_y = scr_screen_mouse_get_y( screen_index );
	
node = scr_interface_get_node( id, m_x, m_y );
node_type = scr_interface_get_type( index, m_x, m_y );


if( instance_exists( node ) && instance_exists( core ) )
{
	var interface_offset = inventory_width;
	
	grid = ring[node_type,0];
	node_pos = ds_grid_value_x( grid, 0, e_id, grid_width, e_id, node );
	
	
	// clean lists
	ds_list_clear( menu_options );
	
	switch( access )
	{
		case 0: // Hostile interface
		{
			interface_offset = 0;
			
				// collect core hacking abilities
			if( node.secret_owner == global.player )
			{
				scr_ability_fetch_type_list( global.player_core.core_ability_id, 3, menu_options );
				
				// collect node abilities
				if( node.owner == global.player )
				{
					scr_ability_fetch_type( node, 0, menu_options );
				}
			}
			else
			{
				// collect basic hacking option
				scr_ability_fetch_type_list( global.player_core.core_ability_id, 1, menu_options );
			}
			
		}
		break;
	
		case 1: // Friendly interface
		{
				// collect core antivirus / scanning abilities
				
				
				// collect node abilities
				scr_ability_fetch_type( node, 0, menu_options );
		}
		break;
	}
	
	// set up drawing
	draw_menu = true;
					
	scr_screen_surface_set_active( menu_screen_index, draw_menu );
					
	menu_id = node;
	menu_x = grid[# node_pos, e_x] + f_x - 78 + interface_offset;
	menu_y = grid[# node_pos, e_y] + f_y - 78;
					
	scr_screen_surface_set_xy( menu_screen_index, menu_x, menu_y );
	
	// play sound
	audio_play_sound( snd_interface_ping, 3, false );
}