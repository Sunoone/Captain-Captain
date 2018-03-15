/// @description scr_hacking_action( target_id, action, owner*, arg3* )
// @param target_id
// @param action
// @param owner*
// @param arg3*

// This script excecutes an hacking script with the given parameters

switch( argument[1] )
{
	case 0:
		scr_hacking_0_disable( argument[0] );
		break;
	
	case 3:
		scr_hacking_3_control( argument[0], argument[2] );
		break;
	
	default:
		return -4;
}