/// @description update screen
// We draw the interface elements in a circulair interface here


// draw cicles
surface_set_target( screen_id );

draw_circle_color( s_width, s_height, rad_0, c_blue, c_blue, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist, c_aqua, c_aqua, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist*2, c_ltgray, c_ltgray, false );
draw_circle_color( s_width, s_height, rad_0 - r_dist*3, c_dkgray, c_dkgray, false );


// draw seperation lines
for( var i = 0; i < max_rings; i++ )
{
	for( var j = 0; j < grid_width; j++ )
	{
		var e = ds_grid_get( ring[i,0], j, e_id );
		if( instance_exists( e ) )
		{
			var x1, x2, y1, y2, dir;
	
			dir = (360 / grid_width) * (j - 0.5);
			
			repeat(2)
			{
				x1 = s_width + lengthdir_x(  rad_0 - r_dist * ( max_rings - i), dir );
				y1 = s_height + lengthdir_y( rad_0 - r_dist * ( max_rings - i), dir );
			
				x2 = s_width + lengthdir_x(  rad_0, dir );
				y2 = s_height + lengthdir_y( rad_0, dir );
			
				draw_line_color(x1,y1,x2,y2,c_black,c_black);
				
				dir = (360 / grid_width) * (j + 0.5 + e.interface_width - 1);
			}
		}
	}
}

// draw links
for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	for( var j = 0; j<grid_width; j++ )
	{
		var o = grid[# j, e_id ];
		var p = grid[# j, e_link ];
		
		if( instance_exists( o ) && instance_exists( p ) )
		{
			var x1, x2, y1, y2;
			x1 =  grid[# j, e_x ];
			y1 =  grid[# j, e_y ];
			
			var grid_above = ring[i - 1, 0];
			var parent_index = ds_grid_value_x( grid_above, 0, e_id, grid_width - 1, e_id, p );
			
			x2 =  grid_above[# parent_index, e_x ];
			y2 =  grid_above[# parent_index, e_y ];
			
			draw_line_width_color( x1, y1, x2, y2, 3, c_white, c_white );
		}
	}
}

/*
// draw connection line
if( instance_exists(select_id) )
{
	//debug_size = ds_list_size(select_id.children);
	
	var ls_x, ls_y;
	
	ls_x = ds_list_find_value( ring[select_ring,6], select_pos);
	ls_y = ds_list_find_value( ring[select_ring,7], select_pos);
	
	draw_line_width_color( mouse_x - f_x, mouse_y - f_y, ls_x, ls_y, 3, c_yellow, c_yellow );
}
*/


// draw interface icons
for( var i = 0; i<max_rings; i++)
{
	var grid = ring[i,0];
	p_len = (rad_0*0.5) - (r_dist*0.5) + (r_dist*i); // distance from the center based on the ring number
	
	for( var j = 0; j<grid_width; j++ )
	{
		var ele_id, ele_x, ele_y, ele_spr;
			
		ele_id =  grid[# j, e_id]; // object id
			
		if( instance_exists( ele_id ) )
		{
			ele_x = grid[# j, e_x]; // element x
			ele_y = grid[# j, e_y]; // element y
			ele_spr = grid[# j, e_spr]; // element sprite
				
			draw_sprite( spr_baseNode, 0, ele_x, ele_y);
			draw_sprite( ele_spr, 0, ele_x, ele_y );		
		}			
	}
	
}



surface_reset_target();