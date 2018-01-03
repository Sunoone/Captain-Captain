/// @description Debug - Deactivate left thruster
if (!instance_exists(objects[coreX -3,coreY +1]))
	return;
	
var leftThruster = objects[coreX -3,coreY +1];
leftThruster.active = false;
