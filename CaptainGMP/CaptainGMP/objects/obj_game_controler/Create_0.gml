/// @description Ini vars
// settup game

// set constant variables, FIRST SCRIPT THAT NEEDS TO BE EXECUTED!
// place before main menu when we get around to creating that
scr_init_game_constants();

// create management objects for the various systems
scr_init_game_objects();

// Set a global reference to this object
global.game_controler = id;

var room_hh = room_height * 0.5;

// create combat screen
global.combat_screen_index = scr_screen_surface_create( room_width - room_hh, room_height, room_hh, 0, true ); 
global.combat_screen = scr_screen_surface_get_id( global.combat_screen_index );

// Player
global.player = 0;	// declares the player to be owner 0;

// Interface wheel
global.owned_interface[0] = scr_create_interface( 0, room_height * 0.5, room_height * 0.5, room_height * 0.5, 0 );
global.owned_interface[1] = scr_create_interface( 0, 0, room_height * 0.5, room_height * 0.5, 1 );



// Ships
global.registry = ds_list_create();

	//blue ship -> player ship
debug_ship_0 = scr_create_ship_small_ship( 0, 500, 700 );
debug_ship_0.direction = 90;
//debug_ship_0.turning = 1;

	//red ship
debug_ship_1 = scr_create_ship_small_ship( 1, 500, 200 );
debug_ship_1.ship_sprite = spr_ship_3;
debug_ship_1.direction = 270;
debug_ship_1.turning = -1;


/*
var c,p;
c = 0;
p = 0;

player[p,c] = scr_create_object( obj_ship, 0, 250, 250, 1 ); 
var player_ship = player[0,c]; c++;

player[p,c] = scr_create_object( obj_software_targeting, 0, 0, 0, 0, player_ship ); c++;

player[p,c] = scr_create_object( obj_fire_control, 0, 0, 0, -1, player_ship ); c++;

player[p,c] = scr_create_object( obj_turret_1, 0, -20, 30, -1, player_ship ); c++;
player[p,c] = scr_create_object( obj_turret_1, 0, -20, -30, -1, player_ship ); c++;

player[p,c] = scr_create_object( obj_truster_1, 0, -45, 50, 2, player_ship, 180 ); c++;
player[p,c] = scr_create_object( obj_truster_1, 0, -45, -50, 2, player_ship, 180 ); c++;
*/

// Custom ship
//scr_create_custom_ship( 1 );


//DEBUG target ship
/*
p = 1;
c = 0;
player[p,c] = scr_create_object( obj_target, 1, 100, 100, 100 );
var other_ship = player[1,c]; c++;

player[p,c] = scr_create_object( obj_software_targeting, 1, 0, 0, 0, other_ship ); c++;
player[p,c] = scr_create_object( obj_fire_control, 1, 0, 0, 99, other_ship ); c++;
player[p,c] = scr_create_object( obj_turret_1, 1, 0, 0, 98, other_ship ); c++;

*/

depth = -100;