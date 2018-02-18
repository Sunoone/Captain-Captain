/// @description scr_screen_surface_create(width,height,x,y,active);
/// @argument width
/// @argument height
/// @argument x
/// @argument y
/// @argument active


// This script creates a surface and binds it to the screen controller object (which then draws it)
// returns the index of the surface

globalvar screen;

var h = array_height_2d(screen.screen_surface);

screen.screen_surface[h,0] = argument4;									// boolean that indicates if the surface is active
screen.screen_surface[h,1] = surface_create( argument0, argument1 );	// surface id
screen.screen_surface[h,2] = argument0;									// width
screen.screen_surface[h,3] = argument1;									// height
screen.screen_surface[h,4] = argument2;									// x position
screen.screen_surface[h,5] = argument3;									// y position

return h;