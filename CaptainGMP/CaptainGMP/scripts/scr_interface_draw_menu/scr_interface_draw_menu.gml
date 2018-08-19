/// @description scr_interface_draw_menu()


if( draw_menu && instance_exists( menu_id ) && instance_exists( core ) )
{	
	// fetch menu
	scr_interface_fetch_menu( menu_options, menu_id, core, id );
	
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
	
	var menu_item_count, angle_div, len_x, len_y, cost, col, player_core;
	
	menu_item_count = ds_list_size( menu_options ) / 5;
	angle_div = 360 / menu_item_count;
	
	player_core = global.player_core;
	
	for( var i = 0; i<menu_item_count; i++ )
	{	
		len_x = 78 + lengthdir_x( 51, angle_div * i );
		len_y = 78 + lengthdir_y( 51, angle_div * i );
		
		cost = scr_ability_excecute_script( 1, menu_options[| i * 5 + 1 ], menu_id, player_core );
		
		if( cost > player_core.cpu_available )
			col = c_black
		else 
			col = c_white
		
		if( point_distance( len_x,len_y,m_x,m_y ) < 26 ) // mouse is over this option
		{
			draw_sprite_ext( spr_baseNode, 0, len_x, len_y, 1, 1, 0, c_black, 1 );
			
			draw_set_valign(fa_middle);
			draw_text_colour( 160, 10,  string( menu_options[| 5 * i + 3] ), c_yellow,  c_yellow,  c_yellow,  c_yellow,  1 );
			draw_text_colour( 160, 30,  "Time: " + string( scr_ability_excecute_script( 2, menu_options[| i * 5 + 1 ], menu_id, player_core ) ), c_red,  c_red,  c_red,  c_red,  1 );
			draw_text_colour( 160, 50,  "CPU: " + string( cost ), c_red,  c_red,  c_red,  c_red,  1 );
			draw_set_valign(fa_top);
			
			scr_resource_display_cost( player_core, cost );
		}
		else
			draw_sprite_ext( spr_baseNode, 0, len_x, len_y, 1, 1, 0, c_black, 0.5 );
		
		draw_sprite_ext( menu_options[| 5 * i ], 0, len_x, len_y, 1, 1, 0, col, 1 );
	}
	
		// draw node status effects
	var sei, sdw, sdh, dw, dh, sp;
	sdw = surface_get_width( menu_surface ) - 10;
	sdh = 10;
	
	for( var i = 1; i < ds_grid_width( menu_id.status_effect_in ); i++ )
	{
		sp = menu_id.status_effect_in[# i,7];
		
			// with and height of icons
		dw = 50;
		dh = 50;
		
			// draw status effect icon
		draw_rectangle_color( sdw - dw, sdh, sdw, sdh + 50, c_black, c_black, c_black, c_black, false );
		draw_sprite( sp, 0, sdw - round( dw * 0.5 ), sdh + round( dh * 0.5 ) );
		
			// mouse over this icon?
		if( m_x > sdw - dw && m_x < sdw && m_y > sdh && m_y < sdh + dh )
		{
			draw_set_valign(fa_middle);
			
				// draw name
			draw_text_colour( 160, 10, menu_id.status_effect_in[# i,6] , c_yellow,  c_yellow,  c_yellow,  c_yellow,  1 );
			
			// draw origin
			if( instance_exists(menu_id.status_effect_in[# i,2]) )
				draw_text_colour( 160, 30, menu_id.status_effect_in[# i,2].name, c_gray,  c_gray,  c_gray,  c_gray,  1 );
			
				// get value
			var v, sv;
			
			v = menu_id.status_effect_in[# i,3];
			if( menu_id.status_effect_in[# i,11] )
				sv = string( v * 100 ) + "%";
			else
				sv = string(v);
			
			if( v > 0 )
				sv = "+" + sv;
			
				// get stat value name
			var n = scr_stat_get_name( menu_id.status_effect_in[# i,4] ) + " ";
			
				// draw value
			draw_text_colour( 160, 50, n + sv , c_white,  c_white,  c_white,  c_white,  1 );
			
			draw_set_valign(fa_top);
		}
		
			// check for next icon space
		sdh += 10 + dh;
		if( sdh > surface_get_height( menu_surface ) - 10 - dh )
		{
			sdh = 10;
			sdw -= 10 + dw;
		}
	}
	
	
		// reset drawing surface
	surface_reset_target();
}