/// @description Ini base vars
// Always inherent this event

// Add all standard variables if they are not overwritten by the object's create event
parent = -4;
animation_speed = 0; // animation speed, frames per second
animation_count = 0; //subimage
parent_direction = 0; //direction from parent
self_direction = 0;	//direction offset from parent
hp = 100;
mass = 1;
armor = 0;
rotation_lock = true; //overwite with false if the object does not rotate with it's parent
active = true; //is the object active? 
children = ds_list_create(); //keeps all linked object ids
interface_width = 1; // the width of the interface element for the object
allowed_type = ds_list_create(); //keeps all objects that are able to link to this object

HP_max = 100;	// max HP of object 
HP = 100;		// current HP of object
regen = 0.025;	// every sec, 2.5% hp is regained

type = -1; // set type of object, THIS SHOULD BE OVERWRITTEN TO REGISTER WITH THE INTERFACE!

name = "Base Combat Object";

/*
//draw sprite_index
if( sprite_exists( sprite_index ) )
{
	object_surface = surface_create( sprite_get_width(sprite_index), sprite_get_height(sprite_index) );
	
	surface_set_target(object_surface );
	draw_clear_alpha(c_black, 0);
	draw_sprite(sprite_index,0, sprite_get_xoffset(sprite_index), sprite_get_yoffset(sprite_index) );
	surface_reset_target();
}
else object_surface = -1;
*/
object_surface = -1;