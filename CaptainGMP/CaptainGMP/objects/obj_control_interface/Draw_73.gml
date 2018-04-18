/// @description Outside of interface


// draw the drag sprite
if( drag_hold )
{
	if( sprite_exists( drag_sprite ) )
	{
		var a = 1;
		
		if( !scr_screen_mouse_above( screen_index ) )
			a = 0.5;
		
		/*
		if( inventory_index != -4 && a = 0.5 )
		{
			if( !scr_screen_mouse_above( inventory_index ) )
				a = 0.5;
			else
				a = 1;
		}
		*/
		
		var col = c_white;
		if( index != drag_id.owner ) 
			col = c_red;
		
		draw_sprite_ext( spr_baseNode, 0, mouse_x, mouse_y, 1, 1, 0, col, a );
		draw_sprite_ext( drag_sprite, 0, mouse_x, mouse_y, 1, 1, 0, c_white, a );
		
		var node = -4;
		
		if( scr_screen_mouse_above( screen_index ) )
			node = scr_interface_get_node( id, scr_screen_mouse_get_x( screen_index ) , scr_screen_mouse_get_y( screen_index )  );
		/*
		else if( scr_screen_mouse_above( inventory_index ) )
			node = ds_grid_get( inventory, scr_screen_mouse_get_y( inventory_index ) / inventory_width, e_id );
		*/
		
		if( instance_exists( node ) && node != drag_id )
		{
			if( node.interface_width == drag_id.interface_width /*|| scr_screen_mouse_above( inventory_index )*/ )
			{	
				if( node.type == drag_ring )
					draw_sprite( spr_switch, 0, mouse_x + 15, mouse_y + 15);
			}
		}
		
	}
}