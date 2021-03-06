/// @description Update Access
// This piece of code updates the access state machine

if( global.player == index && access != 1 ) // this is a FRIENDLY interface and needs to be updated as such
{
	access = 1;	
	
	for( var i = 0; i<max_rings; i++)
	{
		ds_grid_set_region( ring[i,0], 0, e_visible, grid_width -1, e_visible, 1 );
	}
	
	select_id = -4;
	select_pos = -1;
	select_type = -1;
	
	inventory_width = 0;
	
	/*
	if( inventory_index == -4 )
	{
		inventory_index = scr_screen_surface_create( inventory_width, f_height,f_x, f_y  ,true);
	}
	else
	{
		scr_screen_surface_set_active( inventory_index, true );
	}
	
	scr_screen_surface_set_xy( screen_index, f_x + inventory_width, f_y );
	*/
	
	global.player_core = core;
}

if( global.player != index && access == 1 ) // this is a HOSTILE interface and needs to be updated as such
{
	access = 0;	
	
	drag_sprite = -1;

	drag_hold = false;
	
	drag_id = -4;
	drag_ring = -4;
	drag_pos = -4;
	
	for( var i = 0; i<max_rings; i++)
	{
		ds_grid_set_region( ring[i,0], 0, e_visible, grid_width -1, e_visible, -1 );
	}
	ds_grid_set_region( ring[2,0], 0, e_visible, grid_width -1, e_visible, 0 ); // set components to obscured
	
	for( var i = 0; i<max_rings; i++)
	{
		var grid = ring[i,0];
		for( var j = 0; j<grid_width; j++ )
		{
			var e = grid[# j, e_id ];
			if( instance_exists( e ) )
			{
				if( e.has_been_hacked )
					grid[# j, e_visible ] = 1;
				else if( e.has_been_revealed )
					grid[# j, e_visible ] = 0;
			}
		}
	}
	
	
	select_id = -4;
	select_pos = -1;
	select_type = -1;
	
	if( inventory_index != -4 )
		scr_screen_surface_set_active( inventory_index, false );
		
	scr_screen_surface_set_xy( screen_index, f_x, f_y );
}