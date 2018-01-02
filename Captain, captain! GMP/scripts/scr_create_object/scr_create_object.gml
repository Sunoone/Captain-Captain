/// @description scr_create_object(object, owner, x, y, depth, opt:parent, opt:direction)
/// @param object
/// @param owner
/// @param x
/// @param y
/// @param depth
/// @param opt:parent
/// @param opt:direction

// This script creates an combat object with an owner and optionally an parent object
// Combat objects are objects which exist in the combat screen
// If the object has a parent, the provided x and y co-ordinates are relative to the parent

if( argument_count < 5 || argument_count > 7 ) show_error("scr_create_object argument count is incorrect", true)

globalvar game_controler;

	// create the object
var i = instance_create_depth( argument[2], argument[3], argument[4], argument[0] );

i.owner = argument[1]; // index of owner
i.interface = game_controler.player[ argument[1], 1 ]; // id of interface object;
if(!variable_instance_exists(i,"type")) i.type = 2; // set type of object, THIS SHOULD BE OVERWRITTEN FOR NON-COMPONENT OBJECTS!

// Find me!
// Again!

	//register object with interface
if( scr_interface_register( i.interface, i, i.type ) == false )
{
	//The object could not be added to the interface, remove the object
	instance_destroy(i, false);
	return(-4);
}


// Optionally parent the object
if(argument_count >= 6) 
{
	if (instance_exists(argument[5]))
	{
		var p = argument[5];
	
		i.parent = argument[5];
		i.off_x = argument[2];
		i.off_y = argument[3];
		i.off_d = point_direction(0,0, i.off_x, i.off_y );
		i.off_l = sqrt( sqr(i.off_x) + sqr(i.off_y) )
		
		i.parent_direction = p.direction;
		i.x = p.x + argument[2];
		i.y = p.y + argument[3];
	}
}


// Optionally set the direction of the objet
if(argument_count >= 7)
{
	i.self_direction = argument[6];	
}

// Add all standard variables if they are not overwritten by the object's create event
if(!variable_instance_exists(i,"parent")) i.parent = -4;
if(!variable_instance_exists(i,"animation_speed")) i.animation_speed = 0; // animation speed
if(!variable_instance_exists(i,"animation_count")) i.animation_count = 0; //subimage
if(!variable_instance_exists(i,"parent_direction")) i.parent_direction = 0; //direction from parent
if(!variable_instance_exists(i,"self_direction")) i.self_direction = 0;	//direction offset from parent
if(!variable_instance_exists(i,"hp")) i.hp = 100;
if(!variable_instance_exists(i,"mass")) i.mass = 1;
if(!variable_instance_exists(i,"armor")) i.armor = 0;
if(!variable_instance_exists(i,"rotation_lock")) i.rotation_lock = true; //overwite with false if the object does not rotate with it's parent
if(!variable_instance_exists(i,"active")) i.active = true; //is the object active? 
if(!variable_instance_exists(i,"max_children")) i.max_children = 0;
if(!variable_instance_exists(i,"children")) i.children = ds_list_create();

i.direction = i.parent_direction + i.self_direction;

//draw sprite_index
if(!variable_instance_exists(i,"object_surface")) 
{
	var spr = i.sprite_index;
	if( sprite_exists( spr ) )
	{
		i.object_surface = surface_create( sprite_get_width(spr), sprite_get_height(spr) );
		surface_set_target(i.object_surface );
		draw_clear_alpha(c_black, 0);
		draw_sprite(spr,0, sprite_get_xoffset(spr), sprite_get_yoffset(spr) );
		surface_reset_target();
	}
	else i.object_surface = -1;
}


return (i);