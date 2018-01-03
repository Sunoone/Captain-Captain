/// @description rotate and fire

if(rotation_speed != 0 && rotation_lock == false)
{
	if( rotation_speed > rotation_max ) rotation_speed = rotation_max;
	if( rotation_speed < rotation_max * -1 ) rotation_speed = rotation_max * -1;
	
	direction += rotation_speed;
	
	if( max_angle >= 0 && min_angle >= 0 )
	{
		if( direction - self_direction > max_angle + parent.direction && direction - self_direction < min_angle + parent.direction )
		{
			if( rotation_speed > 0)
			{
				direction = parent.direction + max_angle - self_direction;
			}
			else
			{
				direction = parent.direction + min_angle - self_direction;
			}
		}
	}
}

	//needs to be changed when we have actual damage + projectiles in the game
if(active && fire && reload)
{
	// set animation + speed
	animation_count = animation_start;
	animation_speed = animation_fire_speed;
	alarm[0] = fire_time;
	alarm[1] = max(fire_time, reload_time);
	
	globalvar combat_screen_index, combat_screen;

	surface_set_target(combat_screen);

	var b_x = x + lengthdir_x(1000, direction);
	var b_y = y + lengthdir_y(1000, direction);

	draw_line_color(x, y, b_x, b_y, c_red, c_red );
			
	surface_reset_target();
	
	reload = false;
}