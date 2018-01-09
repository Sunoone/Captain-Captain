/// @description scr_create_object(object, owner, x, y, depth, opt:parent, opt:direction)
/// @param object
/// @param owner
/// @param x
/// @param y
/// @param depth
/// @param opt:parent
/// @param opt:direction

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!\> DEPRECATED </!!!!!!!!!!!!!!!!!!!!!!!!!!!!! //

// This script creates an combat object with an owner and optionally an parent object
// Combat objects are objects which exist in the combat screen
// If the object has a parent, the provided x and y co-ordinates are relative to the parent

if( argument_count < 5 || argument_count > 7 ) show_error("scr_create_object argument count is incorrect", true)

globalvar game_controler, owned_interface;

	// create the object
var i = instance_create_depth( argument[2], argument[3], argument[4], argument[0] );

i.owner = argument[1]; // index of owner
i.interface = owned_interface[ argument[1] ]; // id of interface object;

	//register object with interface
if( scr_interface_register( argument[1], i, i.type ) == false )
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

i.direction = i.parent_direction + i.self_direction;




return (i);