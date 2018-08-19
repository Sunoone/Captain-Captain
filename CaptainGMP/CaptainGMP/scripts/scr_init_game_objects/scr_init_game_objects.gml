/// @desciption scr_init_game_objects()

// This script creates all objects nessesairy for the game to run
// This script needs to be called right after scr_init_game_constants


// create the timekeeper object, CREATE BEFORE ANY OTHER OBJECTS!
global.time = instance_create_depth( 0,0,0, obj_timekeeper );

// create the keyhandeler, CREATE AS SECOND OBJECT!
global.keyhandeler = instance_create_depth( 0,0,0, obj_keyhandeler );

// create the array keeper object / data object / buff / status effect repository
global.data = instance_create_depth(0,0,0,obj_data);
scr_status_effect_ini();	// load status effect repository into global.data
scr_buff_ini();				// load buff repository into global.data

// create screen controler
global.screen = instance_create_depth(0,0,0,obj_screen_controler);

// Projectile Manager
global.projectile_manager = instance_create_depth( 0,0,-1000, obj_projectile_manager );

// CPU bar
global.resource_display = instance_create_depth( 0,0,-1000, obj_resource_display );