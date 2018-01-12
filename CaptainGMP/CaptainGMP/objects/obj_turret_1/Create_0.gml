/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite vars here
name = "Debug Projectile Turret";

	// rotation
rotation_max = 180;	// max rotation speed, degrees per second

	// turret animation
animation_fire_speed = 6;		// animation speed in frames per second

fire_time = 0.5;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 0.5;				// time between shots

	// projectile type
projectile_type = 0;
projectile_ttl = 3;

projectile_speed = 750; // pixels per sec
turret_speed = 0;

damage_base = 15;
damage_extra = 0;

projectile_sprite = spr_laser_1;
projectile_explosion_sprite = spr_laser_explosion_1;