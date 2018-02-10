/// @description update screen
// We draw the interface elements in a circulair interface here


// get mouse position relative to the screen
var m_x, m_y;
m_x = scr_screen_mouse_get_x( screen_index );
m_y = scr_screen_mouse_get_y( screen_index );

// update selected element
if( instance_exists( global.interface_select_id[index] ) )
{
	global.interface_select_id[index].light_up = 0.1;
}

// draw cicles
surface_set_target( screen_id );

draw_circle_color( s_width, s_height, rad_0, c_blue, c_blue, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist, c_aqua, c_aqua, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist*2, c_ltgray, c_ltgray, false );

var owner_color = c_red;
if( access == 1 ) owner_color = c_green;

draw_circle_color( s_width, s_height, rad_0 - r_dist*3, owner_color, owner_color, false );


// draw seperation lines
for( var i = 0; i < max_rings; i++ )
{
	for( var j = 0; j < grid_width; j++ )
	{
		var e = ds_grid_get( ring[i,0], j, e_id );
		if( instance_exists( e ) && ds_grid_get( ring[i,0], j, e_visible ) >=0 )
		{
			var x1, x2, y1, y2, dir;
	
			dir = grid_spacing * (j - 0.5);
			
			repeat(2)
			{
				x1 = s_width + lengthdir_x(  rad_0 - r_dist * ( max_rings - i), dir );
				y1 = s_height + lengthdir_y( rad_0 - r_dist * ( max_rings - i), dir );
			
				x2 = s_width + lengthdir_x(  rad_0, dir );
				y2 = s_height + lengthdir_y( rad_0, dir );
			
				draw_line_color(x1,y1,x2,y2,c_black,c_black);
				
				dir = grid_spacing * (j + 0.5 + e.interface_width - 1);
			}
		}
	}
}

// draw links && make hacked elements visible
for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	for( var j = 0; j<grid_width; j++ )
	{
		var o = grid[# j, e_id ];
		var p = grid[# j, e_link ];
		
		if( instance_exists( o ) )
		{
			if( o.owner != o.original_owner && grid[# j, e_visible ] < 1 ) // make hacked elements visible
			{
				grid[# j, e_visible ] = 1;
				if( i > 0 && instance_exists( p ) )
				{
					var grid_above = ring[i - 1, 0];
					var parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
					grid_above[# parent_index, e_visible ] = 0;
				}
				
				if( i < 2 )
				{
					var c_size, grid_below, child_index;
					c_size = ds_list_size( o.children );
					grid_below = ring[i + 1, 0];
					for( var c = 0; c < c_size; c++ )
					{
						var child = o.children[|c];
						if( instance_exists( child ))
						{
							child_index = ds_grid_value_x( grid_below, 0, e_id, grid_width - 1, e_id, child );
							
							if( grid_below[# child_index, e_visible ] < 0 )
							{
								grid_below[# child_index, e_visible ] = 0;
								child.has_been_revealed = true;
							}
						}
					}
				}
			}
			
			if( instance_exists( p ) )	// draw links
			{
				var grid_above, parent_index, p_v, e_v;
				
				grid_above = ring[i - 1, 0];
				parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
				
				e_v = grid[# j, e_visible ];
				p_v = grid_above[# parent_index, e_visible ];
				
				if( ( e_v > 0 && p_v >= 0 ) || ( p_v > 0 && e_v >= 0 ) )
				{
					var x1, x2, y1, y2;
					x1 =  grid[# j, e_x ];
					y1 =  grid[# j, e_y ];
				
					x2 =  grid_above[# parent_index, e_x ];
					y2 =  grid_above[# parent_index, e_y ];
			
					draw_line_width_color( x1, y1, x2, y2, 3, c_white, c_white );
				}
			}
		}
	}
}

// draw drag indication lines when draging an element
if(drag_hold && instance_exists( drag_id ) )
{
	var pos, type, col;
	type = scr_interface_get_type( index, m_x, m_y );
	if( type == drag_ring )
	{		
		pos = (scr_interface_get_pos( index, m_x, m_y ) - floor( -0.5 + 0.5 * drag_id.interface_width ) ) mod grid_width;
		while(pos < 0) pos += grid_width;
		
		if( scr_interface_check( index, drag_id, drag_ring, pos, drag_pos ) ) col = c_yellow;
		else col = c_red;
		
		var x1, x2, y1, y2, dir;
		
		dir = grid_spacing * (pos - 0.5);
			
		repeat(2)
		{
			x1 = s_width + lengthdir_x(  rad_0 - r_dist * ( max_rings - drag_ring), dir );
			y1 = s_height + lengthdir_y( rad_0 - r_dist * ( max_rings - drag_ring), dir );
			
			x2 = s_width + lengthdir_x(  rad_0, dir );
			y2 = s_height + lengthdir_y( rad_0, dir );
			
			draw_line_color(x1,y1,x2,y2,col,col);
				
			dir = grid_spacing * (pos + 0.5 + drag_id.interface_width - 1);
		}
	}
}

// draw interface icons ----------------------------------------------------------------------------------------
var player_owned = false;
if( global.player == index ) player_owned = true;

var i_grey, j_grey;
if( drag_hold ) { i_grey = drag_ring; j_grey = drag_pos; }
else { i_grey = -1; j_grey = -1; }
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
			
			}
		}
	}
	
}

// draw the drag sprite
if( drag_hold )
{
	if( sprite_exists( drag_sprite ) )
	{
		draw_sprite( spr_baseNode, 0, m_x, m_y );
		draw_sprite( drag_sprite, 0, m_x, m_y );
	}
}

surface_reset_target();