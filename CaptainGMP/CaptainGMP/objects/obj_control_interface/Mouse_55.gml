/// @description Drag Element

// ini vars
var m_x, m_y

// de-select interface element
global.interface_select_id[index] = -4;

select_id = -4;
select_pos = -1;
select_type = -1;

switch( access )
{
	case 0:
	break;
		
	case 1:
	{
		if( scr_screen_mouse_above( screen_index ) )
		{
			m_x = scr_screen_mouse_get_x( screen_index );
			m_y = scr_screen_mouse_get_y( screen_index );
			
			var grid;	
			// this can be replaced by some math that figures out to which position the mouse is closest
			for( var i = 0; i < max_rings; i++ )
			{
				grid = ring[i,0];
		
				for( var j = 0; j < grid_width; j++ )
				{
						// if statement has a HARDCODED distance, the radius of an interface element
					if( instance_exists( grid[# j, e_id ] ) )
					{
						if( point_distance( m_x, m_y, grid[# j,e_x], grid[# j,e_y] ) <= 25 )
						{
							var node_id = grid[# j, e_id ];
							
							if( node_id.original_owner == global.player )
							{
								drag_hold = true;
					
								drag_sprite = grid[# j, e_spr];
								
								drag_id = node_id;
								drag_ring = i;
								drag_pos = j;
								
								drag_slot = -4;
								
								drag_inventory = false;
								
								audio_play_sound( snd_interface_ping, 3, false );
							}
							break;
						}
					}
				}
				if(drag_hold) break;
			}
		}
		else if( scr_screen_mouse_above( inventory_index ) ) // check inventory
		{
			m_x = scr_screen_mouse_get_x( inventory_index );
			m_y = scr_screen_mouse_get_y( inventory_index );
			
			var pos = floor( m_y / inventory_width );
			
			if( pos >= 0 && pos < inventory_slots )
			{
				if( scr_interface_inventory_check( index, pos ) == false )
				{
					drag_hold = true;
					
					drag_sprite = inventory[# pos, e_spr];
								
					drag_id = inventory[# pos, e_id];
					drag_ring = drag_id.type;
					drag_pos = -4;
					
					drag_slot = pos;
					
					drag_inventory = true;
					
					audio_play_sound( snd_interface_ping, 3, false );
				}
			}
		}
	}
	break;

	default:
	break;
}



