/// @description scr_hacking_0_disable( target_id )
// @param target_id

// this script scrambles the ownership of an object, disabeling it

if( instance_exists( argument0 ) )
{
	argument0.owner = -1 * get_timer();	
}