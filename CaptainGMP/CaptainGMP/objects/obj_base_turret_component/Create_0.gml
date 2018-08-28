/// @description Ini vars

// Inherit the parent event
event_inherited();

name = "Base Turret Component";

// Unlock the rotation for the turret
rotation_lock = false;

delta_x = x;
delta_y = y;

target_x = 0;
target_y = 0;

fire = false;		// fire the turret
reload = true;		// can fire; finished reloading

tracked_projectiles = ds_list_create();

rotation_speed = 0; // rotation speed

	// turret animation
animation_start = 0.0;			// animation count; at what sub-frame does the animation start?
animation_fire_speed = 30;		// animation speed in frames per second


	// Overwrite the values below in inherited turrets
// Turret stats -------------------------------------------------------------------------------------------
name = "Base Turret Component";

	// Bonus
turret_speed = 0;	// speed added to the projectile by turret bonuses
turret_damage = 0;	// damage added to the projectile by turret bonuses

	// rotation
stat[var_rotation_max,1] = 135;	// max rotation speed, degrees per second
max_angle = -1;		// max angle for the turret
min_angle = -1;		// min angle for the turret

	// attack speed
fire_time = 0.2;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 0.5;				// time between shots

	// turret sounds
sound_fire = -1;

	// projectile type
projectile = "none";
projectile_type = 0;
projectile_ttl = 0;

	// projectile stats
projectile_speed = 750; // pixels per sec
projectile_damage = 17;

// --------------------------------------------------------------------------------------------------------
