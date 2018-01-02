/// @description scr_screen_surface_set_xy(index, x, y);
/// @argument index
/// @argument x
/// @argument y


// This script sets the x and y co-ordinated of the screen surface index

globalvar screen;

if( argument0>= array_height_2d(screen.screen_surface) ) show_error("scr_screen_surface_set_xy recieved an out of bounds index", true);

screen.screen_surface[argument0,4] = argument1;
screen.screen_surface[argument0,5] = argument2;