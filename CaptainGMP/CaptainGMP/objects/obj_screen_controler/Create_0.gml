/// @description Ini vars
// This object controls and draws the surfaces on the screenspace


// screen_surface holds the surfaces and their positions that are drawn to the screen every frame
screen_surface[0,0] = false;

/*
screen_index = scr_screen_surface_create( round(room_width * (2/3)), room_height, round(room_width/3), 0, true ); 
screen_id = scr_screen_surface_get_id( screen_index );

surface_set_target( screen_id );
draw_clear_alpha( c_black, 0 );
draw_text_color( 10, 10, "Combat surface", c_red,c_red,c_red,c_red,1 );
draw_rectangle_color( 1, 1, surface_get_width(screen_id)-2, surface_get_height(screen_id)-2, c_red,c_red,c_red,c_red, true );
surface_reset_target();

alarm[0] = 60;
*/

