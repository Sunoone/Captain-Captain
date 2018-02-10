/// @description scr_create_ship_software(ship, object )
/// @param ship
/// @param object

// This script creates a software object on the given ship

var game_controler, owned_interface, ship, core;
game_controler = global.game_controler;
owned_interface = global.owned_interface;
ship = argument0;

// does the ship have a core that can hold the software?
core = ship.ship_core;
if( ship.ship_core == -1 ) return(-404);



	// create the object
var i = instance_create_depth( -1000, -1000, 1000, argument1 );

i.owner = ship.owner; // index of owner
i.original_owner = i.owner; // set the original owner
i.interface = owned_interface[ i.owner ]; // id of interface object;

// register software with the core
i.core = core;
ds_list_add( core.software, i );


	//register object with interface
if( scr_interface_register( i.owner, i, i.type ) == false )
{
	//The object could not be added to the interface, remove the object
	instance_destroy(i, false);
	return(-4);
}

// Parent the object
var p = ship;

i.parent = p;
i.off_x = 0;
i.off_y = 0;
i.off_d = 0;
i.off_l = 0;
i.parent_direction = p.direction;

return i;