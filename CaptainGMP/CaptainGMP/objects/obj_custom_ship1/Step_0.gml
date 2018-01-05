/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


//clamp(rotation, -1 * maxRotation, maxRotation);

//velocity
//speed
//draw_line_color(100, 100, 800, 800, c_red, c_green);

var force = 1;
var lineLength = 200 * (1/force);


//var debugLinearPower = 1 * (1/force);

//torque = 0;

centerOfMass = vector_create(x, y);


thrusterCount = array_length_1d(thrusters);

surface_set_target(global.combat_screen);
for(i = 0; i < thrusterCount; i++)
{ 
	if (thrusters[i].active)
	{			
		myForce = vector_create_from_direction(-thrusters[i].direction, force);
		pointOfApplication = vector_create(thrusters[i].x, thrusters[i].y);
		momentArm = vector_subtract(centerOfMass, pointOfApplication);
		
		parallelComponent = vector_calc_parallel_component(momentArm, myForce);	
		//torque = vector_calc_torque(centerOfMass, pointOfApplication, myForce);
		torque = vector_cross(momentArm, myForce);
		intertia = 100;
	
		angularAcceleration = torque / inertia;
		turning += angularAcceleration;
	
		velocity[0] += parallelComponent[0] / mass;
		velocity[1] += parallelComponent[1] / mass;
		
		
	
		draw_line_color(thrusters[i].x, thrusters[i].y, thrusters[i].x + (myForce[0] * lineLength), thrusters[i].y + (myForce[1] * lineLength), c_white, c_white);
		draw_line_color(thrusters[i].x, thrusters[i].y, thrusters[i].x + (myForce[0] * -lineLength), thrusters[i].y + (myForce[1] * -lineLength), c_red, c_green);
	
	}
}

surface_reset_target();


var csid = scr_screen_surface_get_id(global.combat_screen_index);
var width = surface_get_width(csid);
var height = surface_get_height(csid);

x += velocity[0];
y += velocity[1];

if (x > width) x = 0;
if (y > height) y = 0;

	
if (x < 0) x = width;
if (y < 0) y = height;
	
direction += turning;
