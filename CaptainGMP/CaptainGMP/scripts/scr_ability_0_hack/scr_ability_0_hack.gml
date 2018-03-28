/// @description scr_ability_0_hack( target_id, owner )
/// @param target_id
/// @param owner

// This script starts a basic hack on the target

if( instance_exists( argument0 ) )
{
	// To do: add basic hacking code here
	
		// set secret owner
	argument0.secret_owner = argument1;
}