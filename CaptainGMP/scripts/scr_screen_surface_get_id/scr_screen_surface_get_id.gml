/// @description scr_screen_surface_get_id(index);
/// @argument index

// This script returns a surface id based on the index from the screen_surface array in the screen controler object

globalvar screen;

var h = argument0;

// check if the index is out of bounds
if( h>= array_height_2d(screen.screen_surface) ) show_error("scr_screen_surface_get_id recieved an out of bounds index", true);

// check if the surface exists
if( surface_exists( screen.screen_surface[h,1] ) == false )
{
	// if not, recreate the surface
	screen.screen_surface[h,1] = surface_create( screen.screen_surface[h,2], screen.screen_surface[h,3] );
}

// return the surface id
return( screen.screen_surface[h,1] );