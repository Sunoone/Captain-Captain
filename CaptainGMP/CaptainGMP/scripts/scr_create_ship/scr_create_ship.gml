/// @description scr_create_ship( object, owner, x, y )
/// @param object
/// @param owner
/// @param x
/// @param y

// This script creates a ship object 

var game_controler, owned_interface;

game_controler = global.game_controler;
owned_interface = global.owned_interface;

	// create the object
var i = instance_create_depth( argument2, argument3, 100, argument0 );

i.owner = argument1; // index of owner
i.interface = owned_interface[ argument1 ]; // id of interface object;

	//register object with interface
if( scr_interface_register( argument1, i, i.type ) == false )
{
	//The object could not be added to the interface, remove the object
	instance_destroy(i, false);
	return(-4);
}

return (i);