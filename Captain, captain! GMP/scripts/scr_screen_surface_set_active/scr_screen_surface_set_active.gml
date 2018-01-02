/// @description scr_screen_surface_set_active(index, active);
/// @param index
/// @param active


// This script sets the active boolean of an surface

globalvar screen;

if( argument0>= array_height_2d(screen.screen_surface) ) show_error("scr_screen_surface_set_active recieved an out of bounds index", true);

screen.screen_surface[argument0,0] = argument1;