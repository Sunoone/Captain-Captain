/// @description scr_interface_draw_menu()

// this script draws drag indication lines when draging an element


if( draw_menu && instance_exists( menu_id ) && instance_exists( core ) )
{	
	// Update the menu options
	ds_list_clear( menu_options );
	
	var app_own = scr_object_apparent_owner_get(menu_id, global.player);
	
	switch( access )
	{
		case 0: // Hostile interface
		{
			// collect core hacking abilities
			if( menu_id.secret_owner == global.player )
			{
				scr_ability_fetch_type_list( global.player_core.core_ability_id, 3, menu_options, global.player_core, menu_id );
				
				// collect node abilities
				if( menu_id.owner == global.player )
				{
					scr_ability_fetch_type( menu_id, 0, menu_options, global.player_core, menu_id );
				}
			}
			else
			{
				// collect basic hacking option
				scr_ability_fetch_type_list( global.player_core.core_ability_id, 1, menu_options, global.player_core, menu_id );
			}
		}
		break;
	
		case 1: // Friendly interface
		{
				// collect core antivirus / scanning abilities
				scr_ability_fetch_type_list( core.core_ability_id, 2, menu_options, core, menu_id );
				
				// collect node abilities
				scr_ability_fetch_type( menu_id, 0, menu_options, core, menu_id );
				
				if( app_own != index )
				{
					// collect antivirus tools
					
				}
		}
		break;
	}
	
	// Drawing
	var menu_surface = scr_screen_surface_get_id( menu_screen_index );
	surface_set_target( menu_surface );
	
	draw_clear_alpha( c_black, 0.25 );
	
	// draw menu background
	draw_sprite_ext( spr_radial_menu_extended, 0, 78, 78, 1, 1, 0, c_white, 0.75 );
	
	// draw menu options / icons
	var m_x, m_y;
	
	m_x = scr_screen_mouse_get_x( menu_screen_index );
	m_y = scr_screen_mouse_get_y( menu_screen_index );
	
	var menu_item_count, angle_div, len_x, len_y;
	
	menu_item_count = ds_list_size( menu_options ) / 4;
	angle_div = 360 / menu_item_count;
	
	for( var i = 0; i<menu_item_count; i++ )
	{	
		len_x = 78 + lengthdir_x( 51, angle_div * i );
		len_y = 78 + lengthdir_y( 51, angle_div * i );
		
		if( point_distance( len_x,len_y,m_x,m_y ) < 26 ) // mouse is over this option
		{
			draw_sprite_ext( spr_baseNode, 0, len_x, len_y, 1, 1, 0, c_black, 1 );
			
			draw_set_valign(fa_middle);
			draw_text_colour( 160, 10,  string( menu_options[| 4 * i + 3] ), c_yellow,  c_yellow,  c_yellow,  c_yellow,  1 );
			draw_text_colour( 160, 30,  "Time: " + string( scr_ability_excecute_script( 2, menu_options[| i * 4 + 1 ], menu_id, global.player_core ) ), c_red,  c_red,  c_red,  c_red,  1 );
			draw_text_colour( 160, 50,  "CPU: " + string( scr_ability_excecute_script( 1, menu_options[| i * 4 + 1 ], menu_id, global.player_core ) ), c_red,  c_red,  c_red,  c_red,  1 );
			draw_set_valign(fa_top);
			
			scr_resource_display_cost( global.player_core, scr_ability_excecute_script( 1, menu_options[| i * 4 + 1 ], menu_id, global.player_core ) );
		}
		else
			draw_sprite_ext( spr_baseNode, 0, len_x, len_y, 1, 1, 0, c_black, 0.5 );
		
		draw_sprite( menu_options[| 4 * i ], 0, len_x, len_y );
	}
	
	surface_reset_target();
}