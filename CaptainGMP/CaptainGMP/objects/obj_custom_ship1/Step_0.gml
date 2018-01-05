/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//clamp(rotation, -1 * maxRotation, maxRotation);

//velocity
//speed



if (thrusters[0].active)
{	
	centerOfMass = vector_create(x, y);
	pointOfApplication = vector_create(thrusters[0].x, thrusters[1].y);
	momentArm = vector_subtract(centerOfMass, pointOfApplication);
	
	myForce = vector_create_from_direction(thrusters[0].direction);
	
	parallelComponent = vector_multiply(momentArm, vector_dot(myForce, momentArm) / vector_dot(momentArm, momentArm));
	angularForce = vector_subtract(myForce, parallelComponent);
	
	torque = vector_multiply(angularForce, vector_magnitude(momentArm));
	
	angularAcceleration = torque / intertia;
	
	
	//parallelComponent = momentArm * (dot(myForce, momentArm) / dot(momentArm, momentArm))
	//angularForce = myForce - parallelComponent
	
	
	
	//force = vector_create_from_direction(direction + thrusters[0].self_direction, .1);

	turning = vector_cross(vector_subtract(centerOfMass, pointOfApplication), force);
}

direction += turning;
