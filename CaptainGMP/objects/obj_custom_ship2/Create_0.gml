/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var a, b, d; a = 1; b = 0; d = 5;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = 0;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = 1;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = -1;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); a = 0; b = 1;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); a = 0; b = -1;
hulls[coreX+a, coreY+b] = scr_create_grid_object(obj_hull, 0, 0, coreX+a, coreY+b, d, id, 0); 

a = 1; b = 0; d = -5;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = 0;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = 1;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_turret_1, 0, 0, coreX+a, coreY+b, d, id, 0); a = -1; b = -1;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, 0, coreX+a, coreY+b, d, id, 0); a = 0; b = 1;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, 0, coreX+a, coreY+b, d, id, 0); a = 0; b = -1;
objects[coreX+a, coreY+b] = scr_create_grid_object(obj_fire_control, 0, 0, coreX+a, coreY+b, d, id, 0);




