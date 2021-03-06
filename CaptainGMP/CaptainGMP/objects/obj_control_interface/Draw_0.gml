/// @description Outside of interface


// draw the drag sprite
if( drag_hold )
{
	if( sprite_exists( drag_sprite ) )
	{
		var col = c_white;
		if( index != drag_id.owner ) 
			col = c_red;
		
		draw_sprite_ext( spr_baseNode, 0, mouse_x, mouse_y, 1, 1, 0, col, 1 );
		draw_sprite( drag_sprite, 0, mouse_x, mouse_y );
		
		var node = scr_interface_get_node( id, mouse_x, mouse_y );
		if( instance_exists( node ) && node != drag_id )
		{
			if( node.interface_width == drag_id.interface_width )
			{	
				draw_sprite( spr_switch, 0, mouse_x + 15, mouse_y + 15);
			}
		}
		
	}
}