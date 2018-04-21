/// @description Insert base truster functionality in this object
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = 2;
name = "Base Truster Component";

	// Stats
stat[ var_maxThrust, 1] = 500;	// Max Trust

	// Internal vars
screen_offset_x = scr_screen_surface_get_x( global.combat_screen_index );
screen_offset_y = scr_screen_surface_get_y( global.combat_screen_index );

thrust_direction = direction+180;

thrust = 0;	// thrust per second
thrust_vector = vector_create(0,0);
torque = 0;
parent_position = vector_create(0,0);
application_point = vector_create(0,0);


// DEBUG
DEBUG_colour = make_color_rgb(50,100,255);