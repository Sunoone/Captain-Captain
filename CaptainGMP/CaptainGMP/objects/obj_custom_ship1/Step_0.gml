/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//clamp(rotation, -1 * maxRotation, maxRotation);

//velocity
//speed



if (thrusters[0].active)
{
	
	//show_debug_message("turning");
	
	X = scr_create_array(thrusters[0].x, thrusters[0].y); // Point of application
	P = scr_create_array(X[0] - x, X[1] - y); // Moment arm
	
	F = scr_create_array(-1, 0); // Force
	I = 1;

	torque = P[0]*F[1]-P[1]*F[0];
	angAccel = torque/I;
	show_debug_message(angAccel);
	direction += angAccel;
	
}