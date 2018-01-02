/// @description Ini vars
// 

global.game_controler = id;

// create screen controler
screen_controler = instance_create_depth(0,0,0,obj_screen_controler);

var room_hh = room_height * 0.5;

// create combat screen
global.combat_screen_index = scr_screen_surface_create( room_width - room_hh, room_height, room_hh, 0, true ); 
global.combat_screen = scr_screen_surface_get_id( global.combat_screen_index );

var c,p;
c = 0;
p = 0;

player[p,0] = 0; c++;

player[p,1] = scr_create_interface( 0, room_height * 0.5, room_height * 0.5, room_height * 0.5 ); c++;

player[p,c] = scr_create_object( obj_ship, 0, 250, 250, 1 ); 
var player_ship = player[0,c]; c++;

player[p,c] = scr_create_object( obj_software_targeting, 0, 0, 0, 0, player_ship ); c++;

player[p,c] = scr_create_object( obj_fire_control, 0, 0, 0, -1, player_ship ); c++;

player[p,c] = scr_create_object( obj_turret_1, 0, -20, 30, -1, player_ship ); c++;
player[p,c] = scr_create_object( obj_turret_1, 0, -20, -30, -1, player_ship ); c++;

player[p,c] = scr_create_object( obj_truster_1, 0, -45, 50, 2, player_ship, 180 ); c++;
player[p,c] = scr_create_object( obj_truster_1, 0, -45, -50, 2, player_ship, 180 ); c++;

//debug
//ds_list_add(player[p,3].children, player[p,4], player[p,5]);

player[1,0] = 1; 
player[1,1] = scr_create_interface( 0, 0, room_height * 0.5, room_height * 0.5 );
player[1,2] = scr_create_object( obj_target, 1, 100, 100, 100 );

player[1,3] = scr_create_object( obj_fire_control, 1, 0, 0, 99, player[1,2] );
player[1,4] = scr_create_object( obj_turret_1, 1, 0, 0, 98, player[1,2] );
player[1,5] = scr_create_object( obj_software_targeting, 1, 0, 0, 0, player[1,2] );



depth = -100;