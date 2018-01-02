/// @description alter screen
// for testing purposes

scr_screen_surface_set_xy(screen_index, 100, 100);
screen_id = scr_screen_surface_resize( screen_index, 200, 200 );

surface_set_target( screen_id );
draw_clear_alpha( c_black, 0 );
draw_text_color( 10, 10, "Combat surface", c_red,c_red,c_red,c_red,1 );
draw_rectangle_color( 1, 1, surface_get_width(screen_id)-2, surface_get_height(screen_id)-2, c_red,c_red,c_red,c_red, true );
surface_reset_target();