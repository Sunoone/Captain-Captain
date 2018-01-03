/// @description scr_screen_surface_resize(index, width, height);
/// @argument index
/// @argument width
/// @argument height


// This script resizes surface under the screen surface index
// Returns the id of the surface, this can be the old id or a new one depending on if the surface under the index still existed 

globalvar screen;

var i = argument0; //index

if( i >= array_height_2d(screen.screen_surface) ) show_error( "scr_screen_surface_resize recieved an out of bounds index", true);

screen.screen_surface[i,2] = argument1; // set width
screen.screen_surface[i,3] = argument2; // set height

// resise the surface if it still exists, otherwise create a new surface with the new dimentions
if( surface_exists( screen.screen_surface[i,1] ) ) surface_resize( screen.screen_surface[i,1], argument1, argument2 );
else screen.screen_surface[i,1] = surface_create( argument1, argument2 );

// return the (sometimes new) surface id
return screen.screen_surface[i,1];