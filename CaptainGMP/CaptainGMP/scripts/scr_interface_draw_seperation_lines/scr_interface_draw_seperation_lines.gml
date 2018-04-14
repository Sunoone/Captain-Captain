/// @description scr_interface_draw_seperation_lines()

// this script draws seperation lines for an interface object

// this script is very slow

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