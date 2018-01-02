/// @description scr_interface_register(interface, combat_object, type)
/// @param interface
/// @param combat_object
/// @param type

// This script registers an new interface element with the interface controler
if(argument2 < 0) return true;


var j,w,h, list_rot, list_obj, list_id, list_spr, list_link, list_link_x, list_link_y, list_x, list_y, size;

list_id = argument0.ring[argument2,1];
list_rot = argument0.ring[argument2,2];
list_obj = argument0.ring[argument2,3];
list_spr = argument0.ring[argument2,4];
list_link = argument0.ring[argument2,5];
list_x = argument0.ring[argument2,6];
list_y = argument0.ring[argument2,7];
list_link_x = argument0.ring[argument2,8];
list_link_y = argument0.ring[argument2,9];

size = ds_list_size(list_id);


// check if there is space for the new interface element
if( size +1 >= argument0.ring[argument2,0] ) return false;

// find a position in the list
var pos, obj_type, base_rot;

obj_type = object_get_name(argument1);
pos = ds_list_find_index( list_obj, obj_type );
pos = size;
base_rot = 360 / argument0.ring[argument2,0];

// Add index number and rotation to the lists
ds_list_insert( list_id, pos, argument1 ); // write the combat object id
ds_list_insert( list_rot, pos, base_rot * pos ); // insert a standart rotation in the list
ds_list_insert( list_obj, pos, obj_type ); // write the name of the combat object
ds_list_insert( list_spr, pos, argument1.sprite_index ); // write the sprite of the combat object
ds_list_insert( list_link, pos, -4 ); // write the link of the element
ds_list_insert( list_x, pos, -100 ); // bogus data in x
ds_list_insert( list_y, pos, -100 ); // bogus data in y
ds_list_insert( list_link_x, pos, -100 ); // bogus data in link x
ds_list_insert( list_link_y, pos, -100 ); // bogus data in link y

return true;