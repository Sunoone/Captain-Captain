/// @description scr_create_ship_small_ship( owner, x, y )
/// @param owner
/// @param x
/// @param y

// this script creates a "small ship" under owner at the given co-ordinated

var ship = scr_create_ship( obj_debug_ship, argument0, argument1, argument2 );


var r,c;

	// create core
r = 5; c= 5;
scr_create_ship_object( ship, obj_core, r, c );

	// create software
scr_create_ship_software( ship, obj_software_targeting );

	// create turret controlers
r = 5; c = 4;
scr_create_ship_object( ship, obj_fire_regulator, r, c );

r = 5; c = 6;
scr_create_ship_object( ship, obj_fire_regulator, r, c );

	// create turrets
r = 3; c = 2;
scr_create_ship_object( ship, obj_turret_1, r, c );

r = 9; c = 5;
scr_create_ship_object( ship, obj_turret_1, r, c );

r = 3; c = 8;
scr_create_ship_object( ship, obj_turret_1, r, c );

r = 4; c = 6;
scr_create_ship_object( ship, obj_turret_2, r, c );

r = 4; c = 4;
scr_create_ship_object( ship, obj_turret_2, r, c );

r = 6; c = 5;
scr_create_ship_object( ship, obj_turret_2, r, c );

// create trusters
r = 2; c = 1;
scr_create_ship_object( ship, obj_truster_1, r, c, 90 );

r = 3; c = 3;
scr_create_ship_object( ship, obj_truster_1, r, c, 180 );

r = 7; c = 4;
scr_create_ship_object( ship, obj_truster_1, r, c );

r = 3; c = 5;
scr_create_ship_object( ship, obj_truster_1, r, c, 180 );

r = 7; c = 6;
scr_create_ship_object( ship, obj_truster_1, r, c );

r = 3; c = 7;
scr_create_ship_object( ship, obj_truster_1, r, c, 180 );

r = 2; c = 9;
scr_create_ship_object( ship, obj_truster_1, r, c, 270 );

return ship;