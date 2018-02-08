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

if( ds_exists(tracked_projectiles, ds_type_list) )
{
	switch( projectile_type )
	{
		case 1: // beam, rotate beam with turret
		{
			for( var i = 0; i < ds_list_size(tracked_projectiles); i++ )
			{
				scr_projectile_change_position( tracked_projectiles[|i], x, y );
				scr_projectile_change_direction( tracked_projectiles[|i], direction );
			}
		}
		break;
	
		case 2: // Missile, update target
		{
		
			for( var i = 0; i < ds_list_size(tracked_projectiles); i++ )
			{
				scr_projectile_change_target( tracked_projectiles[|i], target_x, target_y );
			}
		
		}
		break;
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
	
	var dam = turret_damage + projectile_damage;
	
	var v_x, v_y, dir, spe;
	
	spe = projectile_speed + turret_speed;
	dir = direction;
	
	v_x = (x - delta_x) + lengthdir_x( spe, dir );
	v_y = (y - delta_y) + lengthdir_y( spe, dir );
	
	ds_list_add( tracked_projectiles, scr_projectile_add_premade( projectile, owner, x, y, v_x, v_y, dam, projectile_ttl ) );	
	
	if( sound_fire != -1 )
	{
		audio_play_sound( sound_fire, 1, false );
	}
	
	reload = false;
}

// set delta pos 
delta_x = x;
delta_y = y;