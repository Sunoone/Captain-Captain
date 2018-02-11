/// @description Ini vars

// Inherit the parent event
event_inherited();

// overwrite vars here

	// turret animation
animation_fire_speed = 3.2;		// animation speed in frames per second


// Turret stats -------------------------------------------------------------------------------------------
name = "Debug Beam Turret";
HP_max = 250;
HP = 250;

	// Bonus
turret_speed = 1200;	// speed added to the projectile by turret bonuses
turret_damage = 0;	// damage added to the projectile by turret bonuses

	// rotation
rotation_max = 100;	// max rotation speed, degrees per second
max_angle = -1;		// max angle for the turret
min_angle = -1;		// min angle for the turret

	// attack speed
fire_time = 2.5;				// how long does the fire-ing animation last, in animation_fire_speed / sec
reload_time = 5.5;				// time between shots

	// turret sounds
sound_fire = snd_beam_fire;

	// projectile type
projectile = "debug_beam";
projectile_type = scr_premade_projectile_get_type( projectile );
projectile_ttl = 2.5;

	// projectile stats
projectile_speed = 0; // pixels per sec
projectile_damage = 100; // dps

// --------------------------------------------------------------------------------------------------------