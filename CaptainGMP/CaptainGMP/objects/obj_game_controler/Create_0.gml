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
global.combat_screen_index = scr_screen_surface_create( room_width - room_hh - 20, room_height, room_hh + 20, 0, true ); 
global.combat_screen = scr_screen_surface_get_id( global.combat_screen_index );

clouds = instance_create_depth( 0,0, 5000, obj_clouds );
clouds.screen_index = global.combat_screen_index;

	// Owners
// Player
global.player = 0;	// declares the player to be owner 0;
global.player_core = -4;

// Interface wheel
global.owned_interface[0] = scr_create_interface( 0, room_height * 0.5, room_height * 0.5, room_height * 0.5, 0 );
global.owned_interface[1] = scr_create_interface( 0, 0, room_height * 0.5, room_height * 0.5, 1 );

// Ships
global.registry = ds_list_create();
global.owner_core[0] = -4;

	// blue ship -> player ship
debug_ship_0 = scr_create_ship_small_ship( 0, 600, 750 );
debug_ship_0.direction = 90;

	// red ship -> AI ship
debug_ship_1 = scr_create_ship_small_ship( 1, 600, 250 );
debug_ship_1.ship_sprite = spr_ship_3;
debug_ship_1.direction = 270;

scr_AI_create( debug_ship_1.ship_core, obj_AI_hacking_1, obj_AI_defence_1 );



depth = -100;