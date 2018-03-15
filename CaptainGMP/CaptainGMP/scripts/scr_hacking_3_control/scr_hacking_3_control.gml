/// @description scr_hacking_3_control( target_id, owner )
// @param target_id
// @param owner

// This script sets the ownership of an object to the given owner, granting control to said owner

if( instance_exists( argument0 ) )
{
	argument0.owner = argument1;
}