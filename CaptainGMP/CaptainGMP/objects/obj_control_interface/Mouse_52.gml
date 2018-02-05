/// @description Drag Element

switch( access )
{
	case 0:
	break;
		
	case 1:
	{
		// dragging an interface element across the screen
		if(drag_hold)
		{
			if( !scr_screen_mouse_above( screen_index ) )
			{
				drag_hold = false;
				drag_sprite = -1;
		
				audio_play_sound( snd_interface_reject, 3, false );
			}
		}
	}
	break;

	default:
	break;
}