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
rotation_max = 135;	// max rotation speed, degrees per second

animation_start = 0.75;				// animation count; at what sub-frame does the animation start?
animation_fire_speed = 7.5;		// animation speed in frames per second

fire_time = 0.3;	// how long does the fire-ing animation last, in sec
reload_time = 0.6; // time between shots, never shorter than the fire time, in frames
