/// @description scr_ability_check_running( node, owner )
/// @param node
/// @param owner

// this script checks if an ability of the given owner is already running on the node

if( instance_exists( argument0 ) )
{
	var h = array_height_2d( argument0.ability_running );
	
	if( h - 1 >= argument1 )
		if( argument0.ability_running[ argument1, 0 ] >= 0 )
			return true;
}

return false;