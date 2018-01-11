/// @description Ini vars

// Inherit the parent event
event_inherited();

// Unlock the rotation for the turret
rotation_lock = false;
type = 2; // register as a component

delta_x = x;
delta_y = y;

fire = false;		// fire the turret
reload = true;		// can fire; finished reloading

max_angle = -1;		// max angle for the turret
min_angle = -1;		// min angle for the turret

rotation_speed = 0; // rotation speed
rotation_max = 135;	// max rotation speed, degrees per second

animation_start = 1.0;			// animation count; at what sub-frame does the animation start?
animation_fire_speed = 10;		// animation speed in frames per second

fire_time = 0.2;				// how long does the fire-ing animation last, in sec
reload_time = 0.5;				// time between shots

name = "Base Combat Component";

	// turret type
projectile_type = 0;
projectile_ttl = 3;

projectile_speed = 500; // pixels per sec
turret_speed = 0;

damage_base = 10;
damage_extra = 0;

projectile_sprite = spr_laser_1;
projectile_explosion_sprite = spr_laser_explosion_1;