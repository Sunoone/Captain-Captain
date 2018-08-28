/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite vars here

	// turret animation
animation_fire_speed = 6;		// animation speed in frames per second

// Turret stats -------------------------------------------------------------------------------------------
name = "Debug Projectile Turret";

	// Bonus
turret_speed = 0;	// speed added to the projectile by turret bonuses
turret_damage = 0;	// damage added to the projectile by turret bonuses

	// rotation
stat[var_rotation_max,1] = 180;	// max rotation speed, degrees per second
max_angle = -1;		// max angle for the turret
min_angle = -1;		// min angle for the turret

	// attack speed
fire_time = 0.5;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 0.75;				// time between shots

	// turret sounds
sound_fire = snd_cannon_fire;

	// projectile type
projectile = "debug_laser";
projectile_type = scr_premade_projectile_get_type( projectile );
projectile_ttl = 3;

	// projectile stats
projectile_speed = 750; // pixels per sec
projectile_damage = 450;

// --------------------------------------------------------------------------------------------------------