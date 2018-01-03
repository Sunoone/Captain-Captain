/// @description scr_screen_surface_get_y(index);
/// @argument index


// This script returns the y co-ordinated of the screen surface index

globalvar screen;

if( argument0>= array_height_2d(screen.screen_surface) ) show_error("scr_screen_surface_get_y recieved an out of bounds index", true);

return screen.screen_surface[argument0,5];