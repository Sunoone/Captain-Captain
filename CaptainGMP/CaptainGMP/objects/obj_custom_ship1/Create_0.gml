/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


turning = 0;

// C = x, y

centerOfMass = undefined;
pointOfApplication = undefined;
force = undefined;

centerOfMass = undefined;
pointOfApplication = undefined;
momentArm = undefined;
	
myForce = undefined;
	
mass = 50;
inertia = mass * 10;

thrusterCount = 0;
	
velocity = undefined;
velocity[0] = 0;
velocity[1] = 0;

parallelComponent = undefined;
angularForce = undefined;
	
torque = undefined;
//inertia = 5;
angularAcceleration = undefined;

angularVelocity = undefined;
distToCom = undefined;
//turning = math_cross(math_subtract_vectors(centerOfMass, pointOfApplication), force);


/*X = undefined; // Point of application
F = undefined; // Force
P = undefined; // Moment arm
I = undefined;

torque = undefined;
angAccel = undefined;*/

//myForce = scr_create_array(
//a =  0; b =  2;	objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, 0, coreX+a, coreY+b, d, id, 0);
//a =  0; b = -2; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, 0, coreX+a, coreY+b, d, id, 0); 