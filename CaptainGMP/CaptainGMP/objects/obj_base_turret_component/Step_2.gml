/// @description rotate and fire

// Inherit the parent event
event_inherited();

// Write code here
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
	
	rotation_speed = 0;
}

// if projectile_type == beam, rotate beam with turret
if(projectile_type == 1 && projectile != -1)
{
	scr_projectile_change_position( projectile, x, y );
	scr_projectile_change_direction( projectile, direction );
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
	
	var dam = damage_base + damage_extra;
	
	var v_x, v_y, dir, spe;
	
	spe = projectile_speed + turret_speed;
	dir = direction;
	
	v_x = (x - delta_x) + lengthdir_x( spe, dir );
	v_y = (y - delta_y) + lengthdir_y( spe, dir );
	
	projectile = scr_projectile_add( owner, projectile_type, x, y, v_x, v_y, dam, projectile_sprite, projectile_ttl, projectile_explosion_sprite );	
	
	reload = false;
}

// set delta pos 
delta_x = x;
delta_y = y;