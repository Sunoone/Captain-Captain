/// @description Update Access
// This piece of code updates the access state machine

if( global.player == index && access != 1 ) // this is a FRIENDLY interface and needs to be updated as such
{
	access = 1;	
}

if( global.player != index && access == 1 ) // this is a HOSTILE interface and needs to be updated as such
{
	access = 0;	
	
	drag_sprite = -1;

	drag_hold = false;
	
	drag_id = -4;
	drag_ring = -4;
	drag_pos = -4;
}