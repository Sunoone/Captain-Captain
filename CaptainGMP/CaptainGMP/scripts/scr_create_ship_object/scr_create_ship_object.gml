/// @description scr_create_ship_object(ship, object, grid_x, grid_y, opt:direction)
/// @param ship
/// @param object
/// @param grid_x
/// @param grid_y
/// @param opt:direction

// This script creates an object on the given ship with an optional direction offset

if( argument_count < 4 || argument_count > 5 ) show_error("scr_create_ship_object argument count is incorrect", true)

// check if the object can be created at the given co-ordinates
if( scr_ship_pos_check( argument[0], argument[1], argument[2], argument[3] ) == false ) return -5;

var game_controler, owned_interface, ship;
game_controler = global.game_controler;
owned_interface = global.owned_interface;
ship = argument[0];

var obj_x, obj_y, pos_off;
pos_off = ship_grid_size * 0.5;

obj_x = pos_off + ( argument[2] - (ship.ship_hallign + ship.ship_hallign_off) ) * ship_grid_size;
obj_y = pos_off + ( argument[3] - (ship.ship_vallign + ship.ship_vallign_off)  ) * ship_grid_size;

	// create the object
var i = instance_create_depth( ship.x + obj_x, ship.y + obj_y, -1, argument[1] );

i.owner = ship.owner; // index of owner
i.original_owner = i.owner; // set the original owner
i.interface = owned_interface[ ship.owner ]; // id of interface object;

if( scr_obj_check_parentage( i, obj_base_core ) )
{
	// register with the ship
	if( ship.ship_core == -1 )
	{
		ship.ship_core = i;	
	}
}

	//register object with interface
if( scr_interface_register( ship.owner, i, i.type ) == false )
{
	//The object could not be added to the interface, remove the object
	instance_destroy(i, false);
	return(-4);
}

// Parent the object
i.parent = ship;
i.off_x = obj_x;
i.off_y = obj_y;
i.grid_x = argument[2];
i.grid_y = argument[3];
i.off_d = point_direction(0,0, i.off_x, i.off_y );
i.off_l = sqrt( sqr(i.off_x) + sqr(i.off_y) )
i.parent_direction = ship.direction;

// Optionally set the direction of the objet
if(argument_count >= 5)
{
	i.self_direction = argument[4];	
}

i.direction = i.parent_direction + i.self_direction;

// add the created object to the ship_grid
scr_3d_array_set( ship.ship_grid, argument[2], argument[3], ship_object, i );
ship.draw_grid_object_recheck = true;