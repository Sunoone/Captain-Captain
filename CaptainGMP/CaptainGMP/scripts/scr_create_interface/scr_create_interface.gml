/// @description scr_create_object( x, y, width, height, index)
/// @param x
/// @param y
/// @param width
/// @param height
/// @param index

// This script creates an interface object 

	// create the object
var i = instance_create_depth( argument0 , argument1 ,0,obj_control_interface)

	// Get a private screen from the screen controler
i.screen_index = scr_screen_surface_create( argument2, argument3, argument0, argument1, true );
i.screen_id = scr_screen_surface_get_id( i.screen_index );
i.index = argument4;

i.f_width = argument2;
i.f_height = argument3;
i.f_x = argument0;
i.f_y = argument1;
i.s_width = round( 0.5 * i.f_width );
i.s_height = round( 0.5 * i.f_height );
i.rad_0 = min(i.s_width,i.s_height) - 5;

return (i);