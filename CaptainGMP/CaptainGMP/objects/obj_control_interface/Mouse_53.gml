/// @description Select


// de-select interface element
global.interface_select_id[index] = -4;

select_id = -4;
select_pos = -1;
select_type = -1;

// check menu
if( draw_menu && scr_screen_mouse_above( menu_screen_index ) )
{	
	var m_x, m_y, menu_item_count, angle_div, len_x, len_y, core;
		
	m_x = scr_screen_mouse_get_x( menu_screen_index );
	m_y = scr_screen_mouse_get_y( menu_screen_index );
		
	menu_item_count = ds_list_size( menu_options ) / 5;
	angle_div = 360 / menu_item_count;
	
	core = global.player_core;
	
	for( var i = 0; i<menu_item_count; i++ )
	{	
		len_x = 78 + lengthdir_x( 51, angle_div * i );
		len_y = 78 + lengthdir_y( 51, angle_div * i );
			
		if( point_distance( len_x, len_y, m_x, m_y ) < 52 )
		{				
			var script = menu_options[| i * 5 + 1 ];
			var cost = scr_ability_excecute_script( 1, script, menu_id, core );
			
			if( core.cpu_available >= cost )
			{
				// run ability
				scr_ability_initiate( 
					core, 
					menu_id, 
					script,
					scr_ability_excecute_script( 2, script, menu_id, core ),
					cost,
					menu_options[| 5 * i ],
					snd_interface_confirm
				);
				
				audio_play_sound( snd_interface_ping, 3, false );
				break;
			}
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
					
					var player_core = global.player_core;
					
					// activate highest priority ability
					if( instance_exists( player_core ) )
					{
						var draw_list = ds_list_create();
						
						// fetch menu
						scr_interface_fetch_menu( draw_list, select_id, player_core, id );
						
						//filter highest priority ability
						var in, prio, s;
						prio = 0;
						in = -1;
						s = ds_list_size( draw_list ) / 5;
							
						for( var n = 0; n < s; n++ )
						{
							if( draw_list[| n * 5 + 4] > prio )
							{
								in = n;
								prio = draw_list[| n * 5 + 4];
							}
						}
							
						if( in >= 0 )
						{
							if( draw_list[| in * 5 + 2] <= player_core.cpu_available )
							{
								var time = scr_ability_excecute_script( 2, draw_list[| in*5 + 1 ], select_id, player_core );
							
								// execute ability								
								scr_ability_initiate( player_core, select_id, draw_list[| in*5 + 1 ], time, draw_list[| in*5 + 2 ], draw_list[| in*5 ], snd_interface_ping );
							
								audio_play_sound( snd_interface_ping, 3, false );
							}
							else
							{
								audio_play_sound( snd_interface_reject, 3, false );	
							}
						}
							
						ds_list_destroy( draw_list );
					}
					
					hold = true;
					
						// old selection code
					//select_pos = j;
					//select_type = i;	
					//global.interface_select_id[index] = select_id;
					
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