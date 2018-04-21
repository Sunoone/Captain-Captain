/// @description vector_calc_torque(centerOfMass, pointOfApplication, force, inertia*);
/// @param centerOfMass
/// @param pointOfApplication
/// @param force
/// @param inertia*

if( argument_count <3 || argument_count > 4) show_error("vector_subtract argument count is incorrect", true);

var centerOfMass = argument[0];
var pointOfApplication = argument[1];
var force = argument[2];

var distToCom = vector_create(pointOfApplication[0] - centerOfMass[0], pointOfApplication[1] -centerOfMass[1] );
//var distToCom = vector_create(centerOfMass[0] - pointOfApplication[0], centerOfMass[1] -pointOfApplication[1] );
var torque = vector_cross(distToCom, force);

return torque;	