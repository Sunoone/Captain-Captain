/// @description Drag Element

switch( access )
{
	case 0:
	break;
		
	case 1:
	{
		if(drag_hold && instance_exists( drag_id ) )
		{
			var node = -4;
			
			if( scr_screen_mouse_above( screen_index ) ) // interface wheel
			{
			
				var grid;
				grid = ring[drag_ring,0];
			
				// look for ring space
				var m_x, m_y, grid, type, pos;
			
				m_x = scr_screen_mouse_get_x( screen_index );
				m_y = scr_screen_mouse_get_y( screen_index );
			
				grid = ring[ drag_ring, 0];
		
				type = scr_interface_get_type( index, m_x, m_y );
				pos = ( scr_interface_get_pos( index, m_x, m_y ) - floor( -0.5 + 0.5 * drag_id.interface_width ) ) mod grid_width;
				while(pos < 0) pos += grid_width;
			
				if( type == drag_ring && scr_interface_check( index, drag_id, type, pos, drag_pos ) ) // place element here 
				{
					// valid position, move element
					if( drag_inventory ) scr_interface_inventory_remove( index, drag_slot ); // remove node being moved
					else scr_interface_remove( index, drag_ring, drag_pos ); // remove node being moved
					
					scr_interface_add( index, drag_id, type, pos );
				
					audio_play_sound( snd_interface_confirm, 3, false );
				
					node = -5;
				}
				else node = scr_interface_get_node( id, m_x, m_y );
			
				if( type == drag_ring && node > 0 && node != drag_id) // check for switching interface elements
				{
					if( node.interface_width == drag_id.interface_width )
					{
						pos = ds_grid_value_x( grid, 0, e_id, grid_width-1, e_id, node ); // recalculate position
					
						scr_interface_remove( index, drag_ring, pos ); // remove node under mouse
						
						if( drag_inventory ) scr_interface_inventory_remove( index, drag_slot ); // remove node being moved
						else scr_interface_remove( index, drag_ring, drag_pos ); // remove node being moved
					
						scr_interface_add( index, drag_id, drag_ring, pos ); // add drag node
						
						if( drag_inventory ) scr_interface_inventory_add( index, node, drag_slot ); // add switch node
						else scr_interface_add( index, node, drag_ring, drag_pos );	// add switch node
					
						audio_play_sound( snd_interface_confirm, 3, false );
					}
					else
					{
						node = -4;	
					}
				}
			}
			else if( scr_screen_mouse_above( inventory_index ) ) // inventory
			{
				var m_y, pos;
				
				m_y = scr_screen_mouse_get_y( inventory_index );
				
				pos = floor( m_y / inventory_width );
				
				if( pos >= 0 && pos < inventory_slots )
				{
					if( scr_interface_inventory_check( index, pos ) ) // add to empty inventory space
					{
						if( drag_inventory )
							scr_interface_inventory_remove( index, drag_slot ); // remove node being moved
						else
							scr_interface_remove( index, drag_ring, drag_pos ); // remove node being moved
						
						scr_interface_inventory_add( index, drag_id, pos ); // add drag node
				
						audio_play_sound( snd_interface_confirm, 3, false );
						
						node = -5;
					}
					else node = inventory[# pos, e_id ] ;
					
					if( node != -5 && node != drag_id && node.type == drag_ring ) // switch elements
					{
						if( node.interface_width == drag_id.interface_width )
						{
							scr_interface_inventory_remove( index, pos ); // remove node under mouse
						
							if( drag_inventory ) scr_interface_inventory_remove( index, drag_slot ); // remove node being moved
							else scr_interface_remove( index, drag_ring, drag_pos ); // remove node being moved
					
							scr_interface_inventory_add( index, drag_id, pos ); // add drag node
						
							if( drag_inventory ) scr_interface_inventory_add( index, node, drag_slot ); // add switch node
							else scr_interface_add( index, node, drag_ring, drag_pos );	// add switch node
							
							audio_play_sound( snd_interface_confirm, 3, false );
						}
					}
					
				}
				
			}
			
			if( node == -4 )
			{
				// invalid position
		
				drag_sprite = -1;
		
				audio_play_sound( snd_interface_reject, 3, false );
			}
		}

		drag_sprite = -1;

		drag_hold = false;
		
		drag_id = -4;
		drag_ring = -4;
		drag_pos = -4;
	}
	break;

	default:
	break;
}





