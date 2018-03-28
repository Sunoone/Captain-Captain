/// @description scr_interface_draw_inventory()

// this script draws the inventory / quarantine space of the interface


if( access == 1 && inventory_index != -4 )
{
	var inventory_screen = scr_screen_surface_get_id( inventory_index );
	
	surface_set_target( inventory_screen );
	
	for( var i = 0; i < inventory_slots; i++ )
	{
		draw_line_color( 0, i * 60, 60, i * 60, c_red, c_red );
		
		if( inventory[# i, g_free ] == false )
		{
			var ele_id =  inventory[# i, e_id ];
			
			if( instance_exists( ele_id ) )
			{
				var col, ele_x, ele_y;
				
				col = c_white;
				ele_x = inventory[# i, e_x ];
				ele_y = inventory[# i, e_y ];
				
					// draw red for hacked nodes
				if( index != ele_id.owner ) 
					col = c_red;
				
				if( inventory[# i, e_id ] == drag_id )
					col = c_dkgray;
				
				draw_sprite_ext( spr_baseNode, 0, ele_x, ele_y, 1, 1, 0, col, 1);
				draw_sprite_ext( inventory[# i, e_spr ], 0, ele_x, ele_y, 1, 1, 0, c_white, 1 );
			}
		}
	}
	
	surface_reset_target();
}