/// @description scr_interface_draw_nodes()

// This script draws an interface nodes

// Call from interface object only

draw_set_halign( fa_center );

var i_grey, j_grey;
if( drag_hold ) { i_grey = drag_ring; j_grey = drag_pos; }
else { i_grey = -1; j_grey = -1; }

var player_index = global.player;
var player_owned = ( index == player_index );


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
				
					// draw yellow for selected nodes
				if( i == select_type && j == select_pos ) 
				{
					col_b = 0;
					col_g = 100;
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
				}
				
				col_r = max( 0, col_r );
				col_g = max( 0, col_g );
				col_b = max( 0, col_b );
				
				col = make_color_rgb( col_r, col_g, col_b );
			
					// draw grey drag-hold sprite
				if( i == i_grey && j == j_grey ) col = c_dkgray;	
				
				draw_sprite_ext( spr_baseNode, 0, ele_x, ele_y, 1, 1, 0, col, 1);
				
				// draw node data
				var m_text = ele_id.interface_data;
				
				if( m_text > 0 )
				{
					var m = ele_id.interface_name_list[|0];
					
					if( m != 0 )
					{
						var p = (ele_id.interface_number_list[|0] / m ) * 100;
						
							// Overdraw
						if( player_owned )
						{
							scr_draw_sprite_loading( spr_baseNode, 0, ele_x, ele_y, col, make_color_rgb(25,255,25), 100-p );
						}
						else
						{
							scr_draw_sprite_loading( spr_baseNode, 0, ele_x, ele_y, col, make_color_rgb(255,25,25), 100-p);
						}
					}
				}
				
				if( grid[# j, e_visible] == 1 || player_owned )
				{
					// display node icon
					draw_sprite_ext( ele_spr, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );				
					
					// display apparent secret owner
					if( scr_object_apparent_owner_known( ele_id, player_index ) )
					{
						var app_own = ele_id.apparent_owner[player_index];
						
						if( app_own == player_index )
							draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );
						else
							draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_red, 1 );
					}
					else
					{
						draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_gray, 1 );
					}
				}
			}
		}
	}
	
}

draw_set_halign( fa_left );