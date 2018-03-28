/// @description scr_hacking_4_basic_hack( target_id, owner )
// @param target_id
// @param owner

// This script starts a basic hack on the target

if( instance_exists( argument0 ) )
{
	// To do: add basic hacking code here
	argument0.owner = argument1;
}