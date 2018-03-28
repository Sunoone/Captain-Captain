/// @description scr_create_object( x, y, width, height, index)
/// @param x
/// @param y
/// @param width
/// @param height
/// @param index

// This script creates an interface object 

	// create an array space for object selection
global.interface_select_id[argument4] = -4;

	// create the object
var i = instance_create_depth( argument0 , argument1 ,-100,obj_control_interface)

	// Get a private screen from the screen controler
i.screen_index = scr_screen_surface_create( argument2, argument3, argument0, argument1, true );
i.menu_screen_index = scr_screen_surface_create( 155 * 3, 155, 0, 0, false ); // get a menu screen

i.screen_id = scr_screen_surface_get_id( i.screen_index );
i.index = argument4;

i.f_width = argument2;
i.f_height = argument3;
i.f_x = argument0;
i.f_y = argument1;
i.s_width = round( 0.5 * i.f_width );
i.s_height = round( 0.5 * i.f_height );
i.rad_0 = min(i.s_width,i.s_height) - 5;

i.ship = -4;
i.core = -4;

return (i);