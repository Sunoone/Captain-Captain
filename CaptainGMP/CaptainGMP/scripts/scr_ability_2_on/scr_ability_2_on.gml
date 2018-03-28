/// @description scr_ability_1_disable( id )
/// @param id

// this script scrambles the ownership of an object, disabeling it

if( instance_exists( argument0 ) )
{
	argument0.owner = -1 * get_timer();	
}