/// @description Ini Interface Object

// inherent the parent event
event_inherited();

	// Object type
type = -1; // set type of object, 0 = software, 1 = regulator, 2 = component THIS SHOULD BE OVERWRITTEN TO REGISTER WITH THE INTERFACE!
name = "Base Combat Object";

	// interface
interface_width = 1;	// the width of the interface element for the object
interface_data = 0;
interface_name_list = ds_list_create();
interface_number_list = ds_list_create();

light_up = 0; // this variable controls how long the object should light up

root = -4; // this is the object above this object in the interface
children = ds_list_create(); // keeps all linked object ids
owned_childern = ds_list_create(); // a list of childern that have the same owner as the regulator
allowed_type = ds_list_create(); //keeps all objects that are able to link to this object