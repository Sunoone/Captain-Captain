/// @description scr_create_thruster(thruster, owner, x, y, depth, opt:parent, opt:direction)
/// @param object
/// @param owner
/// @param x
/// @param y
/// @param depth
/// @param opt:parent
/// @param opt:direction

	
	
a = -3; b = -1; objects[coreX+a, coreY+b] = scr_create_grid_object(argument0, 0, argument1, argument2, argument3, argument4, argument5, argument6);
a = -3; b =  1; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_truster_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
a = -3; b =  2; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_truster_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
thrusters = scr_create_array(objects[coreX -3, coreY +1], objects[coreX -3, coreY -1], objects[coreX-3, coreY+ 2]);