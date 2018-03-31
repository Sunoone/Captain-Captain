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
			
				if( ds_list_size( ele_id.hacking_progress ) > 0 && player_owned == false) // hack in progress
				{
					var sec = ele_id.security_rating;
					var d_col = (sec - scr_ds_list_max(ele_id.hacking_progress)) / sec;
				
					col_r -= 255 * d_col;
					col_g = 255 * d_col;
					col_b = 255 * d_col;
				}
				
					// draw yellow for selected nodes
				if( i == select_type && j == select_pos ) 
				{
					col_b = 0;
					col_g = 100;
				}
			
					// draw red for hacked nodes
				if( index != grid[# j, e_id].owner ) 
				{
					if( i == select_type && j == select_pos ) col_g = 100;
					else col_g = 0;
					col_b = 0;
					col_r = 255;
				}
			
				col = make_color_rgb( col_r, col_g, col_b );
			
					// draw grey drag-hold sprite
				if( i == i_grey && j == j_grey ) col = c_dkgray;
			
				draw_sprite_ext( spr_baseNode, 0, ele_x, ele_y, 1, 1, 0, col, 1);
				
				if( grid[# j, e_visible] == 1 || player_owned )
					draw_sprite_ext( ele_spr, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );
				
				if( ele_id.secret_owner == player_index && !player_owned )
					draw_sprite_ext( spr_hacked_node, 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );
				
				// draw node data
				var m_text = ele_id.interface_data;
					
				if( m_text > 0 )
				{
					var t_col = c_red;
						
					for( var n = m_text - 1; n >= 0; n-- )
					{
						var h = ele_x + n * 20;
						var s;
							
						if( ele_id.interface_name_list[|n] == "" )
							s = string( ele_id.interface_number_list[|n] );
						else
							s = ele_id.interface_name_list[|n] + ": " + string( ele_id.interface_number_list[|n] );
							
						draw_text_color( h, ele_y, s , t_col, t_col, t_col, t_col, 1 );
					}
				}
			}
		}
	}
	
}

draw_set_halign( fa_left );