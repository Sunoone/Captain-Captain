/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite vars here
name = "Debug Missile Turret";

HP_max = 250;
HP = 250;

	// rotation
rotation_max = 0;	// max rotation speed, degrees per second

	// turret animation
animation_fire_speed = 0;		// animation speed in frames per second

fire_time = 0.1;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 0.15;				// time between shots

	// projectile type
projectile_type = 2; // missile
projectile_ttl = 7;

projectile_speed = 150; // pixels per sec
turret_speed = 500;

damage_base = 150; // dps
damage_extra = 0;

projectile_sprite = spr_missile_1;
projectile_explosion_sprite = spr_laser_explosion_1;

	// turret sounds
sound_fire = snd_missile_fire;