/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite vars here
name = "Debug Beam Turret";

HP_max = 250;
HP = 250;

	// rotation
rotation_max = 100;	// max rotation speed, degrees per second

	// turret animation
animation_fire_speed = 16;		// animation speed in frames per second

fire_time = 0.5;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 2.5;				// time between shots

	// projectile type
projectile_type = 1; // beam
projectile_ttl = 1;

projectile_speed = 0; // pixels per sec
turret_speed = 1200;

damage_base = 50; // dps
damage_extra = 0;

projectile_sprite = spr_beam_1;
projectile_explosion_sprite = spr_laser_explosion_1;