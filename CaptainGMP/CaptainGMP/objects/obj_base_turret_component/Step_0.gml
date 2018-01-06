/// @description rotate and fire

var DeltaTime = global.DeltaTime;

// Rotate the Turret
if(rotation_speed != 0 && rotation_lock == false)
{
	var r_max_delta = rotation_max * DeltaTime;
	if( rotation_speed > r_max_delta ) rotation_speed = r_max_delta;
	if( rotation_speed < r_max_delta * -1 ) rotation_speed = r_max_delta * -1;
	
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

// Fire the turret
	//needs to be changed when we have actual damage + projectiles in the game
if(active && fire && reload)
{
	// set animation + speed
	animation_count = animation_start;
	animation_speed = animation_fire_speed;
	
	scr_timer_add( id, fire_time, 0 );
	scr_timer_add( id, reload_time, 1 );

	surface_set_target(global.combat_screen);
	
	var b_x = x + lengthdir_x(1000, direction);
	var b_y = y + lengthdir_y(1000, direction);

	draw_line_color(x, y, b_x, b_y, c_red, c_red );
	
	surface_reset_target();
	
	reload = false;
}