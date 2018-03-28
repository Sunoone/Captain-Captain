/// @description scr_ability_1_disable( target_id, owner )
/// @param target_id
/// @param owner

// this script scrambles the ownership of an object, disabeling it

if( instance_exists( argument0 ) )
{
	argument0.owner = argument1;
	
		// make the object update with the new core
	argument0.register_abilities = true;
}