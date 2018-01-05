/// @description scr_create_custom_ship( owner );
/// @param owner

globalvar owned_interface;

// interface
if( array_length_1d( owned_interface ) <= argument0 )
{
	owned_interface[argument0] = scr_create_interface( room_width - room_height * 0.5, 0, room_height * 0.5, room_height * 0.5 );
}

var i = scr_create_object(obj_custom_ship1, argument0, 500, 400, 0);

with( i )
{
	var a, b, d;  

	d =  1;
	a =  1; b =  0;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a =  2; b =  0;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a = -1; b =  0;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -1; b =  1;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -1; b = -1; hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -2; b =  1;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -2; b = -1; hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a =  0; b =  1;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a =  0; b = -1; hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a =  0; b =  2;	hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a =  0; b = -2; hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, argument0, coreX+a, coreY+b, d, id, 0); 

	d = -1;
	a = -1; b = -1; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_software_targeting, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -1; b = -1; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a =  0; b =  1;	objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a =  0; b = -1; objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a =  1; b =  0;	objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a = -1; b =  0;	objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -1; b =  1;	objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 


	a = -3; b = -1; thrusters[2] = /*objects[coreX+a, coreY+b] =*/ scr_create_grid_object(obj_truster_1, 0, argument0, coreX+a, coreY+b, d, id, 0);
	a = -3; b =  1; thrusters[1] = /*objects[coreX+a, coreY+b] =*/ scr_create_grid_object(obj_truster_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	a = -3; b =  2; thrusters[0] = /*objects[coreX+a, coreY+b] =*/ scr_create_grid_object(obj_truster_1, 0, argument0, coreX+a, coreY+b, d, id, 0); 
	//thrusters = scr_create_array(objects[coreX -3, coreY +1], objects[coreX -3, coreY -1], objects[coreX-3, coreY+ 2]);
	
	//leftThruster = thrusters[coreX -3,coreY +1]))
	return;

}