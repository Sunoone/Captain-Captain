/// @description aim at mouse


if(active && fire && reload)
{
	// set animation + speed
	animation_count = 0.75;
	animation_speed = 0.125;
	alarm[0] = 10;


	globalvar combat_screen_index, combat_screen;

	surface_set_target(combat_screen);

	var b_x = x + lengthdir_x(10000, direction);
	var b_y = y + lengthdir_y(10000, direction);

	draw_line_color(x, y, b_x, b_y, c_red, c_red );
			
	surface_reset_target();
	
	reload = false;
}