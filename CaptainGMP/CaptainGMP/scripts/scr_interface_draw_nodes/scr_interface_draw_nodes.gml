/// @description scr_interface_draw_nodes()

// This script draws an interface nodes

// Call from interface object only



var m_x, m_y;
m_x = scr_screen_mouse_get_x( screen_index );
m_y = scr_screen_mouse_get_y( screen_index );

draw_set_halign( fa_center );

var i_grey, j_grey;
if( drag_hold ) { i_grey = drag_ring; j_grey = drag_pos; }
else { i_grey = -1; j_grey = -1; }

var player_index = global.player;
var player_owned = ( index == player_index );
var player_core = global.player_core;


for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	var p_len = (rad_0*0.5) - (r_dist*0.5) + (r_dist*i); // distance from the center based on the ring number
	
	for( var j = 0; j<grid_width; j++ )
	{
		var ele_id, ele_x, ele_y, ele_spr;
			
		ele_id =  grid[# j, e_id]; // object id
		
		if( instance_exists( ele_id ) )
		{
			if( grid[# j, e_visible] >= 0 ) // visible
			{
				ele_x = grid[# j, e_x]; // element x
				ele_y = grid[# j, e_y]; // element y
				
				grid[# j, e_spr] = ele_id.sprite_index; // update sprite
				ele_spr = grid[# j, e_spr]; // element sprite
			
				var col, col_r, col_g, col_b;
			
				if( grid[# j, e_visible] == 0 && player_owned == false) // obscured
				{
					col_r = 0;
					col_g = 0;  
					col_b = 0;
				}
				else
				{
					col_r = 255;
					col_g = 255;  
					col_b = 255;
				}
			
					// draw red for hacked nodes
				if( index != ele_id.owner && access == 1) 
				{
					if( i == select_type && j == select_pos ) 
						col_g = 100;
					else 
						col_g = 0;
					
					col_b = 0;
					col_r = 255;
				}
				
				if( ele_id.active == false )
				{
					col_b -= 124;
					col_g -= 124;
					col_r -= 124;
					
					if( player_owned == false )
					{
						col_b = 124;
						col_g = 124;
						col_r = 124;
					}
				}
				
				col_r = max( 0, col_r );
				col_g = max( 0, col_g );
				col_b = max( 0, col_b );
				
				col = make_color_rgb( col_r, col_g, col_b );
			
					// draw grey drag-hold sprite
				if( i == i_grey && j == j_grey ) col = c_dkgray;	
				
				draw_sprite_ext( spr_baseNode, 0, ele_x, ele_y, 1, 1, 0, col, 1);
				
				// draw node data
				var m_text, icon_spr;
				m_text = ele_id.interface_data;
				icon_spr = -4;
				
				if( m_text > 0 )
				{
					var m = ele_id.interface_name_list[|0];
					
					if( m != 0 )
					{
						var p, own_col;
						
							// get percentage
						p = (ele_id.interface_number_list[|0] / m ) * 100;
						
							// get owner colour
						if( player_owned )
							own_col = make_color_rgb(25,255,25);
						else
							own_col = make_color_rgb(255,25,25);
						
							// Overdraw loading node
						scr_draw_sprite_loading( spr_baseNode, 0, ele_x, ele_y, col, own_col, 100-p);
						
							// get the icon of the running ability
						if( array_height_2d( ele_id.ability_running) > player_index )
							if( array_length_2d( ele_id.ability_running, player_index ) > 2 )
								icon_spr = ele_id.ability_running[ player_index, 2 ];
					}
				}
				
				// display apparent secret owner
				var app_own = scr_object_apparent_owner_get( ele_id, player_index);
				
				if( app_own == player_index )
					draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );
				else
					draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_red, 1 );
				
				// Display node icon
				if( grid[# j, e_visible] == 1 || player_owned )
					draw_sprite_ext( ele_spr, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );									
				
				// Display currently running ability
				if( sprite_exists( icon_spr ) )
					draw_sprite_ext( icon_spr, 0, ele_x, ele_y, 1, 1, 0, c_white, 0.5 );
				else
				{
					// Draw Highest priority ability icon
					if( point_distance( ele_x, ele_y, m_x, m_y ) < 25 && draw_menu == false )
					{
						if( instance_exists( player_core ) )
						{
							var draw_list = ds_list_create();
							
								// fetch menu
							scr_interface_fetch_priority( ele_id, player_core, draw_list, id );
							
							if( ds_list_size( draw_list ) > 0 )
							{
								var ability_col = c_white;
								if( draw_list[|2] > player_core.cpu_available )
									ability_col = c_black;
									
									// draw ability icon
								draw_sprite_ext( draw_list[|0], 0, ele_x, ele_y, 1, 1, 0, ability_col, 0.75 );
									// draw cost
								scr_resource_display_cost( player_core, draw_list[|2] );
							}
							
							ds_list_destroy( draw_list );
						}
					}
				}
			}
		}
	}
	
}

draw_set_halign( fa_left );