/// @description scr_create_ship( object, owner, x, y )
/// @param object
/// @param owner
/// @param x
/// @param y

// This script creates a ship object 

	// create the ship
var i = instance_create_depth( argument2, argument3, 0, argument0 );

i.owner = argument1; // index of owner
i.interface = global.owned_interface[ argument1 ]; // id of interface object;



return (i);