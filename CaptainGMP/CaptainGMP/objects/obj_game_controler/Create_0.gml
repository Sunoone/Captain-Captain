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

//create combat camera
global.combat_camera = scr_camera_create( global.combat_screen_index );

back = instance_create_depth( 0,0, 4000, obj_background );
back.camera = global.combat_camera;

/*
clouds[0] = instance_create_depth( 0,0, 5000, obj_clouds );
clouds[0].camera = global.combat_camera;
clouds[0].scale = 3;

clouds[1] = instance_create_depth( 0,0, 4999, obj_clouds );
clouds[1].camera = global.combat_camera;
clouds[1].scale = 2;

clouds[2] = instance_create_depth( 0,0, 4998, obj_clouds );
clouds[2].camera = global.combat_camera;
clouds[2].scale = 1;
*/


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

global.combat_camera.focus = debug_ship_0;

	// red ship -> AI ship
debug_ship_1 = scr_create_ship_small_ship( 1, 600, 250 );
debug_ship_1.ship_sprite = spr_ship_3;
debug_ship_1.direction = 270;

scr_AI_create( debug_ship_1.ship_core, obj_AI_hacking_1, obj_AI_defence_1 );



depth = -100;