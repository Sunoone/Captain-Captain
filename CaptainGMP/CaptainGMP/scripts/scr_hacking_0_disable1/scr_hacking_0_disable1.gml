/// @description scr_hacking_0_disable( target_id )
// @param target_id


if( instance_exists( argument0 ) )
{
	argument0.owner = -1 * get_timer();	// scramble ownership
}