/// @description Ini vars

// Inherit the parent event
event_inherited();

// Unlock the rotation for the turret
rotation_lock = false;
type = 2; // register as a component

fire = false;		// fire the turret
reload = true;		// can fire; finished reloading

max_angle = -1;		// max angle for the turret
min_angle = -1;		// min angle for the turret

rotation_speed = 0; // rotation speed
rotation_max = 3;	// max rotation speed

animation_start = 0.75;				// animation count; at what sub-frame does the 
animation_fire_speed = 0.125;

fire_time = 10;	// how long does the fire-ing animation last
reload_time = 20; // time between shots, never shorter than the fire time
