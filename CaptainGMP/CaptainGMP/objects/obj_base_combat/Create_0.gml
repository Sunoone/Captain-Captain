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
owned_childern = ds_list_create(); // a list of childern that have the same owner as the regulator
interface_width = 1; // the width of the interface element for the object
allowed_type = ds_list_create(); //keeps all objects that are able to link to this object

	// hacking
hacking_owner = ds_list_create();		// keeps track of which owner is hacking this object
hacking_level = ds_list_create();		// keeps track of the level of the hack
hacking_progress = ds_list_create();	// keeps track of the progress made by hacking
hack_detected = false;
has_been_hacked = false;
has_been_revealed = false;
can_be_hacked = false;
can_be_hacked_parent = false;
hacked_by = -4;

light_up = 0; // this variable controls how long the object should light up

HP_max = 100;	// max HP of object 
HP = 100;		// current HP of object
regen = 0.025;	// every sec, 2.5% hp is regained

security_level = 3;
security_rating = 4;
quarantine = false;

type = -1; // set type of object, 0 = software, 1 = regulator, 2 = component THIS SHOULD BE OVERWRITTEN TO REGISTER WITH THE INTERFACE!

name = "Base Combat Object";
object_surface = -1;

// interface
interface_data = 0;
interface_name_list = ds_list_create();
interface_number_list = ds_list_create();