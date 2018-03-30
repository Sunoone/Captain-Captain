/// @description Select


// de-select interface element
global.interface_select_id[index] = -4;

select_id = -4;
select_pos = -1;
select_type = -1;

// check menu
if( draw_menu && scr_screen_mouse_above( menu_screen_index ) )
{	
	var m_x, m_y, menu_item_count, angle_div, len_x, len_y;
		
	m_x = scr_screen_mouse_get_x( menu_screen_index );
	m_y = scr_screen_mouse_get_y( menu_screen_index );
		
	menu_item_count = ds_list_size( menu_options ) / 4;
	angle_div = 360 / menu_item_count;
		
	for( var i = 0; i<menu_item_count; i++ )
	{	
		len_x = 78 + lengthdir_x( 51, angle_div * i );
		len_y = 78 + lengthdir_y( 51, angle_div * i );
			
		if( point_distance( len_x, len_y, m_x, m_y ) < 52 )
		{				
			var script = menu_options[| i * 4 + 1 ];
			
			// run ability
			scr_ability_initiate( 
				global.player_core, 
				menu_id, 
				script,
				scr_ability_excecute_script( 2, script, menu_id, global.player_core ),
				scr_ability_excecute_script( 1, script, menu_id, global.player_core ),
				menu_options[| 4 * i ]
			);
			
			audio_play_sound( snd_interface_ping, 3, false );
			break;
		}
	}
}
else if( scr_screen_mouse_above( screen_index ) ) // select node
{
	// ini vars
	var m_x, m_y
	m_x = scr_screen_mouse_get_x( screen_index );
	m_y = scr_screen_mouse_get_y( screen_index );
	
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
					select_id = grid[# j, e_id ];
					select_pos = j;
					select_type = i;
					
					global.interface_select_id[index] = select_id;
					hold = true;
					
					audio_play_sound( snd_interface_ping, 3, false );
					
					break;
				}
			}
		}
		if(hold) break;
	}
}

// clear menu
scr_screen_surface_set_active( menu_screen_index, false );
draw_menu = false;